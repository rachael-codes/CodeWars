# Program: Find the odd integer
# Date: 03/01/21
# Code Wars: https://www.codewars.com/kata/54da5a58ea159efa38000836
# Kyu: 6

# INSTRUCTIONS
# Given an array of integers, find the one that appears an odd number of times.
# There will always be only one integer that appears an odd number of times.

# input: array
# output: the item from the array that occurs an odd # of times

# Algo
# -call the tally method in order to get a hash of nums and their counts (or create the tally
#  method like I did below since Code Wars doesn't accept it)
# -iterate over each k-v pair and select the one in which the value is odd; return its key

# Solution #1
def find_it(array)
  num_counts = {}
  array.each { |num| num_counts[num] = array.count(num) }
  num_counts.select { |k, v| return k if v.odd? }
end

# Refactored
def find_it(array)
  array.select { |num| return num if array.count(num).odd? }
end

# TEST CASES
p find_it([20, 1, -1, 2, -2, 3, 3, 5, 5, 1, 2, 4, 20, 4, -1, -2, 5]) == 5
p find_it([1, 1, 2, -2, 5, 2, 4, 4, -1, -2, 5]) == -1
p find_it([20, 1, 1, 2, 2, 3, 3, 5, 5, 4, 20, 4, 5]) == 5
p find_it([10]) == 10
