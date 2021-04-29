# Program: Exponent Method
# Date: 02/14/21
# Code Wars: https://www.codewars.com/kata/5251f63bdc71af49250002d8
# Kyu: 5

# Instructions: Create a method called "power" that takes two integers and returns the value of the first argument raised
# to the power of the second. Return nil if the second argument is negative.

# input: two integers
# output: integer that reps the first integer raised to the power of the second

def power(int1, int2)
  return nil if int2 < 0
  return 1 if int2 == 0

  result = []
  int2.times { |_| result << int1 }
  result.inject(:*)
end

p power(2, 3) == 8
p power(10, 0) == 1
p power(-5, 3) == -125
p power(-4, 2) == 16
p power(2, 3) == 8
p power(3, 2) == 9
p power(-5, 3) == -125
p power(-4, 2) == 16
p power(8, -2) == nil
