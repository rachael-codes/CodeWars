# Alphabetized 
# Code Wars: https://www.codewars.com/kata/5970df092ef474680a0000c9/train/ruby
# Kyu: 6 
# Date: 02/17/21
# Instructions
#   Re-order the characters of a string, so that they are concatenated into a new string in 
#   "case-insensitively-alphabetical-order-of-appearance" order. Whitespace and punctuation shall 
#   simply be removed!

# Algo
# -remove punctuation and spaces 
# -sort by downcased ordinal value then rejoin together 

def clean_string(string)
  string.chars { |char| string.delete!(char) if !('a'..'z').include?(char) && !('A'..'Z').include?(char) }
end 

def alphabetized(string)
  cleaned_string = clean_string(string)
  cleaned_string.chars.sort_by { |char| char.downcase.ord }.join('')
end 

p alphabetized("a ") == "a"
p alphabetized("The Holy Bible$$") == 'BbeeHhilloTy'
p alphabetized(" ") == ""
p alphabetized(" a$$$") == "a"
p alphabetized("a ") == "a"
p alphabetized(" a ") == "a"
8/21