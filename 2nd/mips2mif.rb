#!/usr/bin/ruby
#
# ***************************************************************************
# mips2mif
# Formerly:
#  assemble.rb (uses Instructions.rb and Binary.rb)
#
# Author: Tim Wondergem
# October 27, 2005
# 
# Updated for JLS by Zachary Kurmas 4 October, 2006
#
# Modified to output a memory initialization file (MIF) format for the
# Altera Quartus design tools.
# Kurtis Kredo II March 2007
#
# This file takes input from a file that contains MIPS like
# instructions and converts them into 32-bit binary instructions.  
#
# Usage: assemble.rb <input file> [-w]
#
# The program is used with one mandatory parameter, the input file name, and
# one optional parameter that specifies to write over any existing file. The 
# default output file has the same name as the input file, but has a .mips
# extention.
#
# You may need to change the 1st line of this file to match the directory
# that you have Ruby installed.  You can also remove the 1st line, and put
# the this program in the Ruby directory.
#
# (C) 2005, 2006 Tim Wondergem and Zachary Kurmas
# ***************************************************************************
#
# The MIPS like instructions that are accepted are listed in Instructions.rb.
# Register values are written as $ followed by a number ($1).
#
# Comments are accepted in assembly files as a '#' followed the comments
#
# ***************************************************************************
#
# Version 1.2

# A list of the accepted instructions with their format type and opcode
require "/Users/abiliooliveira/Documents/UCDavis/2ndQuarter/ECS154B/Labs/ecs154b/2nd/Instructions.rb"
# Includes binary string functions
require "/Users/abiliooliveira/Documents/UCDavis/2ndQuarter/ECS154B/Labs/ecs154b/2nd/Binary.rb"

# array of binary lines for output
binlines = Array.new   # lines in binary format
origlines = Array.new  # original input lines

# labels read from the file
labels = Hash.new

# Memory depth (in words) and word width (in bits)
depth = 128
width = 32

# Set to print debug information
debug = false

# The instruction set
iset = Instructions.new

# <---- methods ---->
# takes a "register" value, 
# and returns an integer representing the register
def reg(str)
	# a register can have a "$" followed by an integer
	if str =~ /\$\d{1,2}/
		return str.slice(1,str.size).to_i
	else
		puts "Error in #{ARGV[0]}:"
		puts "'#{str}' is and unrecognized register value. Register values must start with $ and be followed by a number."
		exit
	end
end

   
# <---- main ---->
usage = "Usage: mips2mif <input file> [-w]\nSome limitations:\n * Registers must be specified as $4, $5, $6, etc."

# make sure file specified
if ARGV[0] == nil
	puts usage
	exit
end

# get the basename of the file to read
bname = File.basename(ARGV[0])
# get the file to create
if bname =~ /\./
	outfilename = bname.slice(0,bname.index(".")) + ".mif"
else
	outfilename = bname + ".mif"
end

# if the user didn't specify write over command
if ARGV[1] != "-w"
	# check if file already exists
	if File::exist?(outfilename)
		puts "#{outfilename}: already exists."
		$stdout.write "Would you like to replace it? (y or n)  "
		while answer = $stdin.gets
			if answer =~ /n/i
				$stdout.write "What would you like to re-name it to?  "
				outfilename = $stdin.gets
				break
			elsif answer =~ /y/i
				break
			else
				$stdout.write "Incorrect answer. Choose (y or n)  "
			end
		end
	end
end

#
# First pass to find labels
#
#
# open file
inputFile = File.new(ARGV[0], "r")

inputFile.each_line do |line|
	# remove any comment or blank lines
	if not line =~ /^\s*#/ and not line =~ /^\s+$/
		# If the line contains a colon at the end of the first word,
		# assume it is a label.  (The regexp below won't match #, so we
		# know the label isn't part of a comment.)
		if ( line =~ /\s*\w+:/)
			temps = Array.new
			temps = line.split(/\s+|:/)
			if temps[0] =~ /\s+/
				label = temps[1]
			else
				label = temps[0]
			end

			labels[label] = origlines.size()

			if debug
				puts "Found label:  \"#{label}\" at source line #{origlines.size()}"
			end
		end
		origlines.push(line)
	end
end

inputFile.close

#
# Second pass to make machine code.
#

origlines.each do |line|

	puts "Handline line ->#{line}"
  
	# break up the string into tokens
	tokens = Array.new
	tokens = line.split(/\s+|,\s*|#\s*/)

	if debug
		i = 0
		while i < tokens.length
			puts "Token #{i} is ->#{tokens[i]}<-"
			i += 1
		end
	end
 
	# delete any comments
	i = 0
	while i < tokens.length
		if tokens[i] =~ /#/
			while i < tokens.length
				tokens.delete_at(i)
				i += 1
			end
		end
		i += 1
	end
 
	# remove any empty initial tokens
	if tokens[0] =~ /^\s*$/
		tokens.delete_at(0)
	end
 
	# if the first token contains a label, remove the label.
	if tokens[0] =~ /:/
		tokens.delete_at(0)
	end
 
	# substitute any labels
	if tokens[0] =~ /^(j$|jal)/
		tokens[1] = labels[tokens[1]]
	end
	if tokens[0] =~ /^(beq|bne|bleq)/
		tokens[3] = labels[tokens[3]] - binlines.size() - 1
	end

	# check the first token
	instype = iset.gettype(tokens[0])
 
	# if J-type
	if instype == "J"
		# store opcode in bits 26-31
		tempbits = iset.getopcode(tokens[0]).to_s
		# look at second token, store in bits 0-25
		tempbits += intToBin(tokens[1].to_i,26,true)
	# if R-type
	elsif instype == "R"
		# store 0 (opcode) in bits 26-31
		tempbits = intToBin(0,6)
		if tokens[0] == "jr" then
			# store rs in bits 21-25
			tempbits += intToBin(reg(tokens[1]),5)
			# store 0 in bits 6-20
			tempbits += intToBin(0,15)
		elsif (tokens[0] == "sll") or (tokens[0] == "srl") then
			tempbits += intToBin(0,5)
			tempbits += intToBin(reg(tokens[2]),5)
			tempbits += intToBin(reg(tokens[1]),5)
			tempbits += intToBin(tokens[3].to_i,5)
		else
			# store third token in bits 21-25
			tempbits += intToBin(reg(tokens[2]),5)
			# store fourth token in bits 16-20
			tempbits += intToBin(reg(tokens[3]),5)
			# store second token in bits 11-15
			tempbits += intToBin(reg(tokens[1]),5)
			# store 0 in bits 6-10
			tempbits += intToBin(0,5)
		end
		# store function in bits 0-5
		tempbits += iset.getopcode(tokens[0]).to_s	
	# if I-Type
	elsif instype == "I"
		# check first token for opcode, store in bits 26-31
		tempbits = iset.getopcode(tokens[0])

		# lw or sw 
		if (tokens[0] == "lw") or (tokens[0] == "sw") then
			if tokens[2] =~ /\d+\(\$\d{1,2}\)/
				# split up the offset and register
				params = Array.new
				params = tokens[2].split(/\(|\)/)
 
				# store bits 21-25
				tempbits += intToBin(reg(params[1]),5)
				# store bits 16-20
				tempbits += intToBin(reg(tokens[1]),5)
				# store offset in bits 0-15
				tempbits += intToBin(params[0].to_i,16,true)
			else
				puts "Error: Memory access format invalid. Correct example: lw $4, 8($6)"
				exit
			end
		elsif (tokens[0] == "lui") then
			# store bits 21-25 (Rs)
			tempbits += intToBin(0,5)
			# store bits 16-20 (Rt)
			tempbits += intToBin(reg(tokens[1]),5)
			# store immediate value
			tempbits += intToBin(tokens[2].to_i,16)
		else
			# store bits 21-25
			tempbits += intToBin(reg(tokens[2]),5)
			# store bits 16-20
			tempbits += intToBin(reg(tokens[1]),5)
			# store offset in bits 0-15
			tempbits += intToBin(tokens[3].to_i,16,true)
		end
	# else prompt error
	else
		puts "Error: #{instype} - #{tokens[0]}: Instruction not recognized or supported."
		exit
	end

	# store in array
	binlines.push(tempbits)
end

# output to file
outFile = File.new(outfilename, "w")

outFile.write "DEPTH = #{depth};\n"
outFile.write "WIDTH = #{width};\n"
outFile.write "ADDRESS_RADIX = HEX;\n"
outFile.write "DATA_RADIX = HEX;\n"
outFile.write "CONTENT BEGIN\n"

count = 0
# for each line in array
binlines.each do |line|
	# write line in hex
	outFile.write "#{dectohex(count*1)} : "
	outFile.write "#{bintohex(line.slice(0..31))};\n"   

	count = count + 1
end

outFile.write "END;\n"

# close
outFile.close

puts "Successfully created: #{outfilename}"

# <---- end main ---->

