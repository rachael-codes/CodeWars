# Stop gninnipS My sdroW!
# (https://www.codewars.com/kata/5264d2b162488dc400000001)
# 6 kyu

# Write a function that takes in a string of one or more words, and returns the same string, 
# but with all five or more letter words reversed (Just like the name of this Kata). 
# Strings passed in will consist of only letters and spaces. 
# Spaces will be included only when more than one word is present.

# input: string
# output: string that contains a reversed word if word size >= 5 

# explicit: strings will only have letters and spaces 

# Algo
# split string into words
# iterate over words and reverse word if its size >= 5 
# rejoin words

def spin_words(str)
  str.split.map { |word| word.size >= 5 ? word.reverse : word }.join(' ')
end 

# TEST CASES
p spinWords("Hey fellow warriors") == "Hey wollef sroirraw"
p spinWords("This is a test") == "This is a test" # all less than 5 
p spinWords("This is another test") == "This is rehtona test"
p spinWords("test") == "test"
