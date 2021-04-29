# Program: Get Character Count
# 6 kyu
# Code Wars: https://www.codewars.com/kata/543e8390386034b63b001f31
# Date: 02/11/21

# Write a method that takes a string as an argument and groups the number of times each character
# appears in the string as a hash sorted by the highest number of occurrences.
# The characters should be sorted alphabetically e.g: get_char_count("cba") => {1=>["a", "b", "c"]}
# You should ignore spaces, special characters and count uppercase letters as lowercase ones.

# PEDAC
# input: string
# output: hash with integers as keys and arrays as values

# explicit:
# -sort chars alphabetically
# -sort nums by highest # of occurrences
# -the integer represents the number of occurrences of the letter(s)
# -the arrays contain letters in the string
# -ignore spaces, special chars like punctuation and ignore case

# implicit:
# -do not ignore integers

# Data: Array -> Hash

# Algo
# -delete special chars and spaces; downcase everything; split the string into an array of characters
# -group the letters according to the # of times they occur within the string (their count)
# -iterate over hash and remove extra values + sort values; sort keys from high to low

# First solution
def get_char_count(str)
  str = str.downcase.gsub(/[^a-z0-9]/, '')

  letters = str.chars
  result = letters.group_by { |el| letters.count(el) }
  result.each do |k, value_array|
    value_array.uniq!
  end

  new_result = []
  result.reverse_each { |x| new_result << x }
  new_result = new_result.to_h

  final = new_result.each do |k, value_array|
    value_array.sort!
  end

  final
end

# Refactored
def get_char_count(str)
  letters = str.downcase.gsub(/[^a-z0-9]/, '').chars
  hsh = letters.group_by { |el| letters.count(el) }
  hsh.each { |_, value_array| value_array.sort!.uniq! }.sort.reverse.to_h
end

# TEST CASES
p get_char_count("Mississippi") == { 4 => ["i", "s"], 2 => ["p"], 1 => ["m"] }
p get_char_count("Hello. Hello? HELLO!!") == { 6 => ["l"], 3 => ["e", "h", "o"] }
p get_char_count("aaa...bb...c!") == { 3 => ["a"], 2 => ["b"], 1 => ["c"] }
p get_char_count("aaabbbccc") == { 3 => ["a", "b", "c"] }
p get_char_count("abc123") == { 1 => ["1", "2", "3", "a", "b", "c"] }
