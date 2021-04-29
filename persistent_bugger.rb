# Program: Persistent Bugger
# 6 kyu
# Date: 02/11/21
# Code Wars: https://www.codewars.com/kata/55bf01e5a717a0d57e0000ec/train/ruby

# Write a function, persistence, that takes in a positive parameter num and returns its multiplicative
# persistence, which is the number of times you must multiply the digits in num until you reach a single digit.

# input: integer
# output: integer that represents the # of times you must multiply the digits until reaching a single digit

# implicit:
# -if number is only one digit, return 0

# Data structure: Array + counter

# Algo
# -return 0 if there's only one digit
# -initialize counter to 0
# -initialize array of digits
# -initialize a variable that will contain the result of multiplying the digits in the array
# -loop and multiply the elements in the placeholder array
#  -for every time the loop runs, add one to the counter
#  -if they result in one digit, break out of the loop
#  -else, replace current digits with placeholder digits and keep looping
# -return counter

# My solution
def persistence(int)
  return 0 if int.digits.size == 1

  counter = 0
  nums = int.digits
  result_of_mult = nil

  loop do
    counter += 1
    result_of_mult = nums.inject(:*)
    if result_of_mult.digits.size == 1
      break
    else
      nums = result_of_mult.digits
    end
  end

  counter
end

# Recursive solution
def persistence2(n)
  return 0 if n < 10

  1 + persistence(n.digits.reduce(&:*))
end

# TEST CASES
p persistence(39) == 3 # 3*9=27, 2*7=14, 1*4=4 and 4 has only one digit
p persistence(4) == 0 # 4 is only one digit
p persistence(25) == 2 # 2 * 5 = 10; 1 * 0 = 0.
p persistence(999) == 4 # 9*9*9 = 729; 7*2*9=126; 1*2*6=12; 1*2= 2
