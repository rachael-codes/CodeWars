# Program: Decipher this!
# Date: 02/18/21
# Kyu: 6 (but is more like a 5)
# Code Wars: https://www.codewars.com/kata/581e014b55f2c52bb00000f8

# INSTRUCTIONS
# You are given a secret message you need to decipher. Here are the things you need to know to decipher it:
# For each word:

#     the second and the last letter is switched (e.g. Hello becomes Holle)
#     the first letter is replaced by its character code (e.g. H becomes 72)

# Note: there are no special characters used, only letters and spaces

# ALGORITHM
# 1. convert a word to just letters by separating the numbers from letters, converting the ordinal nums to its 
#    character equivalent then re-joining them
# 2. if the converted word is 2 or less letters, return it; else...
#    convert the word then find its first, second, last, and middle parts 
#    return the result of rearranging it: first char, last char, middle chars, second char
# 3. iterate over each word in the string and transform each into its converted word equivalent; rejoin strings

def convert_to_letters(str)
	nums = %w(0 1 2 3 4 5 6 7 8 9)
	numbers = []
	letters = []
	str.chars.each { |el| nums.include?(el) ? numbers << el : letters << el } 
	numbers.join.to_i.chr + letters.join  
end 

def decipher_one_word(str)
	return convert_to_letters(str) if convert_to_letters(str).chars.size <= 2 
	
	converted = convert_to_letters(str)
	first = converted[0]
	second = converted[1] 
	last = converted[-1]
	middle = converted[2..-2]
	first + last + middle + second
end 

def decipher_this(str)
  str.split.map! { |word| decipher_one_word(word) }.join(' ')
end 

# TEST CASES
p decipher_this("65 119esi 111dl 111lw 108dvei 105n 97n 111ka") #== "A wise old owl lived in an oak"
p decipher_this("84eh 109ero 104e 115wa 116eh 108sse 104e 115eokp") #== "The more he saw the less he spoke"
p decipher_this("84eh 108sse 104e 115eokp 116eh 109ero 104e 104dare") #== "The less he spoke the more he heard"
p decipher_this("84kanh 121uo 80roti 102ro 97ll 121ruo 104ple") #== "Thank you Piotr for all your help"
