# Program: Detect Pangram
# Code Wars: https://www.codewars.com/kata/545cedaa9943f7fe7b000048/train/ruby
# Kyu: 6
# Date: 02/08/21

# A pangram is a sentence that contains every single letter of the alphabet at least once. For example, the sentence
# "The quick brown fox jumps over the lazy dog" is a pangram, because it uses the letters A-Z at least once (case is irrelevant).
# Given a string, detect whether or not it is a pangram. Return True if it is, False if not. Ignore numbers and punctuation.

# input: string
# output: Boolean

# explicit: return true if string contains every letter in alphabet; false otherwise
# implicit: string can include punctuation and capitals, but these don't matter

# Algo
# split string into an array and convert to downcase; delete any non-alphabetic chars
# tally up the characters (solution 1) or find unique occurrences (solution 2)
# if the # in the hash is 26 (length of alphabet), return true; else false

# solution 1
def panagram?(str)
  str = str.downcase.gsub(/[^a-z]/, '')
  str.chars.tally.count == 26
end

# solution 2
def panagram2?(str)
  str = str.downcase.gsub(/[^a-z]/, '')
  str.chars.uniq.count == 26
end

# TEST CASES
p panagram?("The quick brown fox jumps over the lazy dog.") == true
p panagram?("This is not a pangram.") == false
