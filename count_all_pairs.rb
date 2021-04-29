# Program: Count All Pairs
# Date: 2/1/21
# Code Wars: https://www.codewars.com/kata/5c55ad8c9d76d41a62b4ede3/train/ruby
# Kyu: 7

# Instructions
# You are given array of integers, your task will be to count all pairs in that array and return their count.

# PEDAC
# input: arr
# output: integer

# explicit:
# -count the pairs within the input array

# implicit
# -even if number is same, as long as it occurs an even # of times, it's considered a pair (0, 0, 0, 0)
# -if an array is empty or only contains one number, return 0

# D: Arrays

# Algo
# -initialize total to 0
# -create a hash with tally of nums and their frequencies
# -iterate over hash and select items in which the value is greater than 1
# -iterate over hash again and for each value, divide it by 2 (to find a pair) then add this to total
# -return total of pairs

def pairs(arr)
  total_pairs = 0
  counts = arr.tally
  counts_over_one = counts.select { |_, v| v > 1 }
  counts_over_one.each_value { |v| total_pairs += v / 2 }
  total_pairs
end

# TEST CASES
p pairs([1, 2, 5, 6, 5, 2]) == 2
p pairs([1, 2, 2, 20, 6, 20, 2, 6, 2]) == 4
p pairs([0, 0, 0, 0, 0, 0, 0]) == 3
p pairs([1000, 1000]) == 1
p pairs([]) == 0
p pairs([54]) == 0
