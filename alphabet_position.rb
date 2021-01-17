# Program: Alphabet Positions
# Date: 01/16/21
# Code Wars: https://www.codewars.com/kata/546f922b54af40e1e90001da/solutions/ruby/me/best_practice
# Kata: 6

# In this kata you are required to, given a string, replace every letter with its position in the alphabet.

# input: string
# output: string

# explicit:
# -if anything isn't a letter, ignore it

# Algo
# -initialize an array that contains every alphabet letter (make sure a = index 1, not 0)
# -convert every letter in the string to downcase and split the string into an array
# -iterate over array and substitute each letter with the equivalent in the array 
# -delete excessive spaces from the array then rejoin it into a string 

def alphabet_position(str)
	arr = %w(nil a b c d e f g h i j k l m n o p q r s t u v w x y z)
	elements = str.downcase.split('')

	elements.each_with_index do |el, idx|
		arr.include?(el) ? elements[idx] = arr.index(el) : elements[idx] = ''
	end 
	
	elements.delete('')
	elements.join(' ')
end 

# TEST CASE
alphabet_position("The sunset sets at twelve o' clock.") == "20 8 5 19 21 14 19 5 20 19 5 20 19 1 20 20 23 5 12 22 5 15 3 12 15 3 11"