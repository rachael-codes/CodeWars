# Program: Unique in Order
# Code Wars: https://www.codewars.com/kata/54e6533c92449cc251001667/solutions/ruby
# Kyu: 6
# Date: 03/04/21

# INSTRUCTIONS
# Implement the function unique_in_order which takes as argument a sequence and
# returns a list of items without any elements with the same value next to each other and
# preserving the original order of elements.

# PEDAC
# input: string or array
# output: array that reps elements from string that don't have the same value next to them

# Algo
# initialize an array
# create if/else statement depending on whether input is string or not
# 	-if the last element in the result string or array != the element, push it to string
# return (now not empty) array

def unique_in_order(str_or_array)
  result = []

  if str_or_array.is_a? String
    str_or_array.chars.each { |char| result << char if result[-1] != char }
  else
    str_or_array.each { |el| result << el if result[-1] != el }
  end

  result
end

# TEST CASES
p unique_in_order('AAAABBBCCDAABBB') == ['A', 'B', 'C', 'D', 'A', 'B']
p unique_in_order('ABBCcAD')         == ['A', 'B', 'C', 'c', 'A', 'D']
p unique_in_order([1, 2, 2, 3, 3]) == [1, 2, 3]
