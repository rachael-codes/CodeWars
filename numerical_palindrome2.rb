# Numerical Palindrome #2
# Date: 03/04/21
# Code Wars: https://www.codewars.com/kata/58de819eb76cf778fe00005c/ruby
# kyu: 6

# INSTRUCTIONS
# A palindrome is a word, phrase, number, or other sequence of characters which reads the same backward as forward.
# For this kata, single digit numbers will not be considered numerical palindromes.
# For a given number num, write a function to test if the number contains a numerical palindrome or not and return a boolean
# (true if it does and false if does not).
# Return "Not valid" if the input is not an integer or is less than 0.

def palindrome(int)
  return "Not valid" if int.to_i != int || int < 0

  int.digits.any? { |num| int.digits.count(num) > 1 }
end

# TEST CASES
p palindrome(5) == false
p palindrome(1221) == true
p palindrome(141221001) == true
p palindrome(1215) == true
p palindrome(1294) == false
p palindrome("109982") == "Not valid"
