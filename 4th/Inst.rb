#!/usr/local/bin/ruby -w

# ***************************************************************************
# Inst.rb Class
#
# Author: Tim Wondergem
# October 27, 2005
# 
# A class that describes a MIPS instruction: 
# name, instruction type (R, I, or J),  and opcode
#
# (C) 2005 Tim Wondergem
# ***************************************************************************

class Inst
	def initialize(name,type,opcode)
		if not type =~ /r|i|j/i
			puts "Class Inst: '#{type}' is an invalid instruction type. Must be R, I, or J."
			exit
		end

		if opcode.length != 6
			puts "Class Inst: '#{opcode}' has an invalid opcode length. Must be length 6."
			exit
		end

		@name = name
		@type = type
		@opcode = opcode
	end

	def name
		return @name
	end
 
	def type
		return @type
	end
 
	def opcode
		return @opcode
	end
end

