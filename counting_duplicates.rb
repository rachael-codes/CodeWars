# Program: Counting Duplicates
# Date: 02/17/21
# Code Wars: https://www.codewars.com/kata/54bf1c2cd5b56cc47f0007a1/train/ruby
# Kyu: 6
# 6 kyu

# Count the number of Duplicates: Write a function that will return the count of distinct case-insensitive
# alphabetic characters and numeric digits that occur more than once in the input string.
# The input string can be assumed to contain only alphabets (both uppercase and lowercase) and numeric digits.

# Algo
# 1. Split string into array of downcased characters
# 2. Create a hash that contains each letter and # of occurrences (with tally method or manually)
# 3. Iterate over values (which rep # of occurrences of a letter) + select those that are greater than 1; count them

# Solution w/o tally
def duplicate_count(string)
  letters = string.downcase.chars
  hsh = string.downcase.chars.each_with_object({}) { |el, hsh| hsh[el] = letters.count(el) }
  hsh.values.select { |num| num > 1 }.count
end

# One-liner solution w/ tally method
def duplicate_count2(string)
  string.downcase.chars.tally.values.select { |num| num > 1 }.count
end

# TEST CASES
p duplicate_count("") == 0
p duplicate_count("abcde") == 0
p duplicate_count("abcdeaa") == 1
p duplicate_count("abcdeaB") == 2
p duplicate_count("Indivisibilities") == 2
