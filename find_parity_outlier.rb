# Find the Parity Outlier
# Date: 03/04/21
# Code Wars: https://www.codewars.com/kata/5526fc09a1bbd946250002dc/solutions/ruby/
# Kyu: 6

# INSTRUCTIONS
# You are given an array (which will have a length of at least 3, but could be very large) containing integers.
# The array is either entirely comprised of odd integers or entirely comprised of even integers except for a
# single integer N. Write a method that takes the array as an argument and returns this "outlier"

# PEDAC
# input: array
# output: integer that represents the sole odd num or the sole even num in the array

# Algo
# -split the array up into evens and odds w/ partition + assign to an evens var + an odd var
# -if/else
#   -if the size of evens is only 1, return the integer within the evens array
#    else return the integer within the odds array

# First attempt
def find_outlier2(arr)
  evens, odds = arr.partition { |x| x.even? }
  evens.size == 1 ? evens.first : odds.first
end

# Tiny refactor
def find_outlier(arr)
  evens, odds = arr.partition(&:even?)
  evens.size == 1 ? evens.first : odds.first
end

p find_outlier([2, 4, 0, 100, 4, 11, 2602, 36]) == 11
p find_outlier([160, 3, 1719, 19, 11, 13, -21]) == 160
