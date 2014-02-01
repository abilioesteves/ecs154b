#!/usr/local/bin/ruby -w

# ***************************************************************************
# Instructions.rb (uses Inst.rb class)
#
# Author: Tim Wondergem
# October 27, 2005
# 
# Contains an array of "accepted" instructions of Inst class. 
#
# (C) 2005, 2006 Tim Wondergem and Zachary Kurmas
#
# ***************************************************************************

require "/Users/abiliooliveira/Documents/UCDavis/2ndQuarter/ECS154B/Labs/ecs154b/2nd/Inst.rb"
class Instructions
	def initialize
		@insar = Array.new
		@insar[0] = Inst.new("add","R","100000")
		@insar[1] = Inst.new("addi","I","001000")
		@insar[2] = Inst.new("and","R","100100")
		@insar[3] = Inst.new("andi","I","001100")
		@insar[4] = Inst.new("beq","I","000100")
		@insar[5] = Inst.new("bne","I","000101")
		@insar[6] = Inst.new("j","J","000010")
		@insar[7] = Inst.new("jal","J","000011")
		@insar[8] = Inst.new("jr","R","001000")
		@insar[9] = Inst.new("lui","I","001111")
		@insar[10] = Inst.new("lw","I","100011")
		@insar[11] = Inst.new("nor","R","100111")
		@insar[12] = Inst.new("or","R","100101")
		@insar[13] = Inst.new("ori","I","001101")
		@insar[14] = Inst.new("slt","R","101010")
		@insar[15] = Inst.new("slti","I","001010")
		@insar[16] = Inst.new("sll","R","000000")
		@insar[17] = Inst.new("srl","R","000010")
		@insar[18] = Inst.new("sw","I","101011")
		@insar[19] = Inst.new("sub","R","100010")
		@insar[20] = Inst.new("bleq","I","110110")
    end

	# return the opcode based on the name
	def getopcode(name)
		@insar.each do |i|
			if i.name == name
				return i.opcode
			end
		end
		return -1
	end

	# return the type based on the name
	def gettype(name)
		@insar.each do |i|
			if i.name == name
				return i.type
			end
		end
		return -1
	end
end

