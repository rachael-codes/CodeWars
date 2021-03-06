# Program: Your order, please
# Date: 03/03/21 
# Code Wars: https://www.codewars.com/kata/55c45be3b2079eccff00010f/solutions/ruby/me/best_practice
# Kyu: 6 

# INSTRUCTIONS
# Your task is to sort a given string. 
# Each word in the string will contain a single number. 
# This number is the position the word should have in the result.
# Note: Numbers can be from 1 to 9. So 1 will be the first word (not 0).

# If the input string is empty, return an empty string. 
# The words in the input String will only contain valid consecutive numbers.

# PEDAC 
# input: string
# output: string 

# Algo
# -create a global array of strings 0 to 9
# -initialize a result array
# -iterate over global numbers array 
#  -iterate over words in string 
#   -if a word contains a number, push the word to the result array 
# -return the result array rejoined 

NUMBERS = %w(0 1 2 3 4 5 6 7 8 9)

def order(string)
	result = []

	NUMBERS.each do |num|
		string.split.each do |word|
			result << word if word.include?(num)
		end 
	end 

	result.join(' ')
end 



p order("is2 Thi1s T4est 3a") == "Thi1s is2 3a T4est"
p order("4of Fo1r pe6ople g3ood th5e the2") == "Fo1r the2 g3ood 4of th5e pe6ople"
p order("") == ""
