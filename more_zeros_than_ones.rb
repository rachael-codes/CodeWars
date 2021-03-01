# Program: More Zeros Than Ones
# Code Wars: https://www.codewars.com/kata/5d41e16d8bad42002208fe1a/solutions/ruby/me/best_practice
# Kyu: 6
# Date: 03/01/21

# INSTRUCTIONS 
# Create a moreZeros function which will receive a string for input, 
# and return an array containing only the characters from that string 
# whose binary representation of its ASCII value consists of more zeros than ones.

# You should remove any duplicate characters, keeping the first occurence of any such duplicates, 
# so they are in the same order in the final array as they first appeared in the input string.

# All input will be valid strings of length > 0. Leading zeros in binary should not be counted.

# PEDAC 
# input: string
# output: array that reps the chars that when converted to ASCII then binary have more zeros than ones 

# implicit:
# -input string could be upper or lowercase (always letters)

# D - Array

# Algo
# -initialize a result array
# -split the string into an array of chars then make a copy 
# -iterate over the copy of the chars w/ map (transformation) + change each one into its ASCII equivalent then its binary equivalent
# -iterate over the binary nums w/ index and if the count of 0s is greater than the count or one 
#    -use that idx and find what's at that index in the original array and push it to the result array
# -return the result array 

def more_zeros(arr)
	result = []
	chars = arr.chars
	chars_to_change = chars.dup 

	binary_strings = chars_to_change.map { |char| char.ord.to_s(2) } 

	binary_strings.each_with_index do |num, idx|
		result << chars[idx] if num.count('0') > num.count('1')
	end 

	result.uniq
end 

# TEST CASES
p more_zeros('abcde') == ['a', 'b', 'd'] #[a = "1100001", b = "1100010", c = "1100011", d = "1100100", e = "1100101"]
p more_zeros('DIGEST') == ['D','I','E','T']