# Program: Duplicate Encoder
# Code Wars: https://www.codewars.com/kata/54b42f9314d9229fd6000d9c/train/ruby
# Kyu: 6
# Date: 02/17/21

# The goal of this exercise is to convert a string to a new string where each character in the new string is 
#{ }"(" if that character appears only once in the original string, or ")" if that character appears more than 
# once in the original string. Ignore capitalization when determining if a character is a duplicate.

# Algo
# - downcase string + split string into chars and iterate over chars
#   -if chars.count(char) is greater than one, transform into )
#   -else transform into (
# return re-joined string

# Original 
def duplicate_encode(string)
  characters = string.downcase.chars

  result = characters.map do |char| 
  	if characters.count(char) > 1 
  		')' 
  	else 
  		'(' 
  	end 
  end 

  result.join('')
end 

# Refactored 
def duplicate_encode2(string)
  characters = string.downcase.chars
  characters.map { |char| characters.count(char) > 1 ? ')' : '(' }.join('')
end 

p duplicate_encode('din') == '((('
p duplicate_encode("recede") == "()()()"
p duplicate_encode("Success") == ")())())"
p duplicate_encode("(( @") == "))(("

