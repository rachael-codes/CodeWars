# Program: Simple Simple Simple String Expansion
# Code Wars: https://www.codewars.com/kata/5ae326342f8cbc72220000d2
# Kyu: 6
# Date: 03/01/21

## HARD FOR ME 

# INSTRUCTIONS
# Given a string that includes alphanumeric characters ('3a4B2d') return the expansion of that string: 
# The numeric values represent the occurrence of each letter preceding that numeric value. 
# There should be no numeric characters in the final string. Empty strings should return an empty string.

# The first occurrence of a numeric value should be the number of times each character behind it is repeated, 
# until the next numeric value appears.
# Your code should be able to work for both lower and capital case letters.

# explicit:
# -is there are multiple numbers, ignore all but the one right before the letter 

# implicit:
# -empty string return empty string 
# -number applies to every letter that comes thereafter until next number shows up

# Array 

# Algo
# -initialize an empty string 
# -set number to use as multiplier to 1
# -split the string into chars + iterate over the chars... 
#   -if you encounter a number, reassign multiplier num to this number 
#   -else, that number.times add the character to the result array 
# -return re-joined result array 

def string_expansion(string)
	result = ''
	multiplier = 1

	string.chars.each do |char|
		if char.match?(/[0-9]/)
			multiplier = char.to_i
		else 
			result << char * multiplier 
		end 
	end 

	result 
end  


# TEST CASES
p string_expansion('3D2a5d2f') == 'DDDaadddddff' 
p string_expansion('3abc') == 'aaabbbccc' 
p string_expansion('abcde') == 'abcde'
p string_expansion('3abc3') == 'aaabbbccc' 
p string_expansion('') == ''
p string_expansion('3d332f2a') == 'dddffaa' #middle 33 is ignored 

