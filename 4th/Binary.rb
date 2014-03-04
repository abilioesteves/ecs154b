#!/usr/local/bin/ruby -w

# ***************************************************************************
# Binary.rb 
#
# Author: Tim Wondergem
# October 27, 2005
# 
# Contains binary string functions.
#
# (C) 2005, 2006 Tim Wondergem and Zachary Kurmas
#
# ***************************************************************************

# flips the bits of str, the ones complement of a binary string
def onescomplement(str)
	i = 0
	while i < str.length
		if str[i,1] == "0"
			str[i] = "1"
		else
			str[i] = "0"
		end
		i += 1
	end

	return str
end

# takes the two's complement of a binary string
def twoscomplement(str)
	carry = 1
	i = str.length - 1
	finished = false
	str = onescomplement(str)

	until finished
		if str[i,1] == "0"
			str[i] = "1"
			finished = true
		else
			until finished
				if carry == 0
					finished = true
				elsif str[i,1] == "1" and carry == 1
					str[i] = "0"
					carry = 1
				elsif str[i,1] == "0" and carry == 1
					str[i] = "1"
					finished = true
				else
					puts "Error converting to binary string"
				end
				i -= 1
			end
		end
	end
 
	return str
end

# convert integer to binary string
# num is the number to convert, must be Number type
# bits determines how many bits the binary number should have
# ubounds indicates if upper bounds should be checked for a positive number
def intToBin(num, bits, ubounds = false)
	intnum = num
	binvalue = ""
	negative = false
 
	# if the number is negative
	if num < 0
		negative = true
		#take the absolute value of the number
		intnum = intnum.abs
		# check the lower range
		if intnum > 2**(bits - 1)
			puts "Out of bounds error: -#{intnum.to_s}"
			exit
		end
	else
		if ubounds
			# check upper range
			if intnum >= 2**(bits - 1)
				puts "Out of bounds error: #{intnum.to_s}"
				exit
			end
		end
	end

	# convert number to binary    
	while intnum >= 1
		tempval = intnum % 2
		binvalue += tempval.to_s
		intnum  = intnum / 2
	end
	# reverse the bits
	binvalue = binvalue.reverse

	# add 0's to the left to match bits param
	if binvalue.size < bits
		t = bits - binvalue.size
		front = ""
		t.times do 
			front += "0"
		end
		binvalue = front + binvalue 
	end
 
	if negative == true
		binvalue = twoscomplement(binvalue)
	end
 
	return binvalue
end


# <-------- bintohex ---------->
# Converts a string of 1s and 0s to the corresponding hex number
# Note:  The length of str must be a multiple of 4!
def bintohex(str)

	if (str.length % 4 != 0) 
		puts "ERROR!  Input to bintohex must have a length that is a multiple of 4!"
		exit
	end

	hexHash = {
		"0000" => '0',
		"0001" => '1',
		"0010" => '2',
		"0011" => '3',
		"0100" => '4',
		"0101" => '5',
		"0110" => '6',
		"0111" => '7',
		"1000" => '8',
		"1001" => '9',
		"1010" => 'A',
		"1011" => 'B',
		"1100" => 'C',
		"1101" => 'D',
		"1110" => 'E',
		"1111" => 'F',
	}

	answer = ""
	index = 0
	while index < str.length
		part = str.slice(index .. index + 3);
		answer += hexHash[part];
		index += 4
	end

	return answer;  
end

# <-------- dectohex ---------->
# Converts a decimal to hex
def dectohex(number)
	binary = ""
	return "0" if (number == 0);
	while number != 0
		binary = "1" + binary if number % 2 == 1
		binary = "0" + binary if number %2 == 0
		number /= 2
	end

	while binary.length % 4 != 0
		binary = "0" + binary
	end

return bintohex(binary)
end

