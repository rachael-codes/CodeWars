# Program: Delete a Digit
# Code Wars: https://www.codewars.com/kata/5894318275f2c75695000146
# Kyu: 6
# Date: 02/14/21
# Instructions: Given an integer n, find the maximal number you can obtain by deleting exactly one digit of the given number.

# Algo
# -convert integer to string and then separate into chars
# -initialize empty result array

# -get all combinations of digits:
#   -iterate over chars with index, and add to empty result array index 0 through idx plus the next idx to the end

# -iterate over the result array and join each one together into an integer
# -return the maximum value one

# My first solution
def delete_digit(int)
  arr = int.to_s.chars
  result = []

  # essentially, this is a manual way of calling the combination method on array and creating a resulting array
  arr.each_with_index do |num, idx|
    result << arr[0...idx] + arr[idx + 1..-1]
  end

  result.map! { |sub| sub.join.to_i }
  result.max
end

# Solution using Array#combination method
def delete_digit2(int)
  arr = int.to_s.chars
  result = arr.combination(arr.size - 1).to_a
  result.map! { |sub| sub.join.to_i }.max
end

# TEST CASES
p delete_digit(152) == 52
p delete_digit(1001) == 101
