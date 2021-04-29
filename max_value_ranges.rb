# Program: The maximum value of ranges
# Code Wars: https://www.codewars.com/kata/583d10c03f02f41462000137/solutions/ruby
# Kyu: 6
# Date: 03/04/21

# INSTRUCTIONS
# Given an array (arr) of integers and an array (ranges) of ranges (e.g. [[1, 32], [16, 24],...]),
# which represent an index range of arr, calculate the sum of each range (start index and end index are both inclusive) of arr, and return the maximum sum.

# PEDAC
# input: two arrays
# -one is an array of integers and you'll use this to find sums of ranges
# -the other indicates the ranges that you should find

# output: the range w/ the max sum's sum

# D - Arrays

# Algo
# -initialize a result array
# -iterate over array2
#  -for each range, slice the input array 1 and add to result array
# -iterate over result array and sum each slice then return max value

def max_sum(nums, ranges)
  ranges = ranges.each_with_object([]) { |range, arr| arr << nums.slice(range[0]..range[1]) }
  ranges.map { |array| array.reduce(:+) }.max
end

p max_sum([1, -2, 3, 4, -5, -4, 3, 2, 1], [[1, 3]]) == 5 # 5
p max_sum([1, -2, 3, 4, -5, -4, 3, 2, 1], [[1, 4], [2, 5]]) == 0
p max_sum([1, -2, 3, 4, -5, -4, 3, 2, 1], [[1, 3], [0, 4], [6, 8]]) == 6
p max_sum([11, -22, 31, 34, -45, -46, 35, 32, 21], [[1, 4], [0, 3], [6, 8], [0, 8]]) == 88
