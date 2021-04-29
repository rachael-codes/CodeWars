# Program: Transform to Prime
# Code Wars: https://www.codewars.com/kata/5a946d9fba1bb5135100007c
# Kyu: 6
# Date: 03/04/21

# INSTRUCTIONS
# Given a List [] of n integers , find minimum number to be inserted in a list, so that sum of all elements
# of list should equal the closest prime number.

# Explicit
# List size is at least 2 .
# List's numbers will only be positives (n > 0) .
# Repetition of numbers in the list could occur .
# The newer list's sum should equal the closest prime number .

# PEDAC
# Implicit:
# -if when you add up nums, they already equal a prime, return 0

# Algo - MAIN METHOD
# counter = 0
# sum_of_array = arr.inject(:+)

# -loop
#   -keep adding one to the sum of the array until the result is prime
#   -keep adding one to the counter
#   -break when helper method isprime? returns true

# return counter

# HELPER METHOD - isprime?(number)
# initialize a divisor that is the number - 1
# loop (while divisor > 2)
#   return false if number % divisor == 0
#   keep decrementing divisor
# return true

def isprime?(int)
  divisor = int - 1

  while divisor > 2
    return false if int % divisor == 0

    divisor -= 1
  end

  true
end

def minimum_number(arr)
  counter = 0
  sum = arr.inject(:+)

  while !isprime?(sum)
    sum += 1
    counter += 1
  end

  counter
end

# TEST CASES
p minimum_number([3, 1, 2]) == 1 # 3 + 1 + 2 == 6 + 1 == 7
p minimum_number([2, 12, 8, 4, 6]) == 5 # 32.. 33..34..35..36..37 - increase count by 5
p minimum_number([5, 2]) == 0
