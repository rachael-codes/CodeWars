# Program: Count Letters in a String
# Date: 2/1/21
# https://www.codewars.com/kata/5808ff71c7cfa1c6aa00006d/train/ruby
# Kyu: 6

# Instructions...
# count lowercase letters in a given string and return the letter count in a hash with 'letter' as key
# and count as 'value'

# PEDAC
# input: string
# output: hash

# explicit:
# -only count lowercase letters
# -letters must be converted to symbols
# -

# implicit:
# -no input will have uppercase letters of spaces
# -hash is sorted in alphabetical order

# Algo
# -create empty hash
# -split string into array of chars and iterate over chars
#  -convert each char to symbol and add this to empty hash along with the num of times the char appears in array
# return hash

def letter_count(str)
  result = {}
  arr = str.chars
  arr.each { |char| result[char.intern] = arr.count(char) }
  result
end

p letter_count('codewars') == { :a => 1, :c => 1, :d => 1, :e => 1, :o => 1, :r => 1, :s => 1, :w => 1 }
p letter_count('activity') == { :a => 1, :c => 1, :i => 2, :t => 2, :v => 1, :y => 1 }
p letter_count('arithmetics') == { :a => 1, :c => 1, :e => 1, :h => 1, :i => 2, :m => 1, :r => 1, :s => 1, :t => 2 }
