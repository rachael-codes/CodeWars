# Study Session w/ Lucas + Jack
# Date: 02/27/21

# Program: Alphabetize Second of Third 
# Source: Unknown

# INSTUCTIONS: 
# Alphabetize the second letter of every third word in a string.
# # Words are separated by spaces.  

# PEDAC 
# input: string
# output: string 

# explicit:
# -every 3rd word gets changed
# -change every second letter of the changed word (odd indices)

# Algo
# -split the string into words
# -iterate over the words w/ map and index (transformation)
#   -if index minus 2 is zero or index minus 2 % 0 == 3, change it
#     *call helper method on word 
#   if not, return the word normally

# helper - change one word
# -iterate over chars w/ transformation + if idx is even, don't change; if odd, change to uppercase version

def alphabetize(string)
	words = string.split
	result = words.map.with_index do |word, idx| 
		if idx - 2 == 0 || (idx - 2) % 3 == 0 
			change_one(word) 
		else 
			word
		end 
	end 
	result.join(' ')
end 

def change_one(word)
	word.chars.map.with_index { |char, idx| idx.even? ? char : char.upcase }.join('')
end 

# TEST CASES
p alphabetize('the small person is eating a hotdog right now') == 'the small pErSoN is eating a hotdog right nOw'
p alphabetize('the girl') == 'the girl'
p alphabetize('') == ''
p alphabetize('hello world, how are you today?') == 'hello world, hOw are you tOdAy?'
p alphabetize('I am from the city of Barcelona!') == 'I am fRoM the city oF Barcelona!'
