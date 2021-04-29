# Program: Camel Casing
# Code Wars Kata: 6
# Link: https://www.codewars.com/kata/5208f99aee097e6552000148/train/ruby

# PEDAC
# input: string with no spaces
# ouput: string with space before any uppercase letter

# Algo
# - initialize an empty array
# - convert the string into an array and iterate over array...
# - check each each character to see if it's uppercase
# -   if the element IS uppercase, add a space then the character to the empty array
# -   if NOT, just add the character to the empty array (no space beforehand)
# - rejoin the array back into a string and return

# My solution
def solution(str)
  arr = []
  str.chars.each do |char|
    char == char.upcase ? arr << ' ' << char : arr << char
  end
  arr.join
end

# Even simpler solution from Code Wars using map method
def solution2(string)
  string.chars.map { |s| s == s.downcase ? s : " #{s}" }.join
end

# TEST CASES
p solution("camelCasing") == "camel Casing"
p solution("camelCasingTest") == "camel Casing Test"
