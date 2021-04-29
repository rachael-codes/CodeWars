# Program: Minimum Size Subarray
# Date 01/18/21
# Source: Study session wtih Srdjan
# https://leetcode.com/problems/minimum-size-subarray-sum/

# Given an array of n positive integers and a positive integer s, find the minimal length
# of a contiguous subarray of which the sum ≥ s. If there isn't one, return 0 instead.

# Algo
# 1. Find all subarrays
# -initialize an empty array and assign it to a variable named 'subarrays'
# -create a nested loop and iterate over array, finding all subarrays that start at index 0
#  -then all subarrays that start at index 1
#  -then all subarrays that start at index 2
#  -etc. ...keep iterating until you have reached the end of the array
#  -return 'subarrays'
# 2. select only subarrays that when summed are greater or equal to target
# 3. find the subarray with the minimum length
# 4. return 0 if there isn't a contiguous suabarray or which the sum ≥ s

# Srdjan's solution (3 helper functions + 1 main function)
# Helper functions
def find_subarrays(array)
  subarrays = []
  0.upto(array.length - 1) do |start_index|
    start_index.upto(array.length - 1) do |end_index|
      subarrays << array[start_index..end_index]
    end
  end
  subarrays
end

def find_greater(subarrays, target)
  subarrays.select { |subarray| subarray.sum >= target }
end

def find_minimal_length(valid_subarrays)
  valid_subarrays.map { |subarray| subarray.length }.min
end

# Main function
def minSubLength(array, target)
  subs = find_subarrays(array)
  subs_greater_than_target = find_greater(subs, target)
  return 0 if subs_greater_than_target.empty?

  find_minimal_length(subs_greater_than_target)
end

# My solution (slightly altered when trying it on my own for understading)
def find_subarrays(arr)
  subarrays = []
  0.upto(arr.size - 1) do |starter|
    starter.upto(arr.size - 1) do |endpoint|
      subarrays << arr[starter..endpoint]
    end
  end
  subarrays
end

def subs_that_equal_target(subs, target)
  subs.select { |sub| sub.sum >= target }
end

def min_length_sub(subs, target)
  subs = find_subarrays([2, 3, 1, 2, 4, 3])
  subs = subs_that_equal_target(subs, target)
  return 0 if subs.size == 0

  subs.map { |sub| sub.size }.min
end

# TEST CASES
p minSubLength([2, 3, 1, 2, 4, 3], 7) == 2
