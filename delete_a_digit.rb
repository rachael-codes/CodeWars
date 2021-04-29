# Program: Delete a Digit
# Date: 01/16/21

# Code Wars: https://www.codewars.com/kata/5894318275f2c75695000146
# Kata: 6

# Instructions: Given an integer n, find the max number you can obtain by deleting exactly one digit of the given number.

# PEDAC
# input: integer
# output: integer

# Algo
# - initialize an array and add the argument n # of times, where n represents the # of digits
#   - (convert integer to string and count number of digits in string)
# - initialize final array that will contain all versions of integer with one digit removed
# - loop over the first array and delete from the first element the digit at index zero then
#   delete from the next element the digit at index 1 and so until each item has had an element removed
# - add each of these values to the final array in the form of an integer
# - find the max integer value and return it

# My solution
def delete_a_digit(int)
  temp_arr = []
  int = int.to_s
  int_size = int.size
  int_size.times { temp_arr << int }

  count = 0
  final_arr = []
  until count == int_size
    chars = temp_arr[count].chars
    chars.delete_at(count)
    count += 1
    final_arr << chars.join.to_i
  end

  final_arr.max
end

# Another interesting solution
def delete_digit(num)
  digits = num.to_s.chars
  (0...digits.size).map { |idx| (digits[0...idx] + digits[idx + 1..-1]).join.to_i }.max
end

# TEST CASES
p delete_digit(1001) == 101
p delete_digit(152) == 52
p delete_digit(2450) == 450
