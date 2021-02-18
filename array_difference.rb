# Array Difference
# Date: 02/17/21
# Code Wars: https://www.codewars.com/kata/523f5d21c841566fde000009/train/ruby
# Kyu: 6
# Instructions: Your goal in this kata is to implement a difference function, 
# which subtracts one list from another and returns the result.
# It should remove all values from list a, which are present in list b.

def array_diff(arr1, arr2)
  arr1-arr2
end 

# TEST CASES
p array_diff([1,2],[1]) == [2]
p array_diff([1,2], [1]) == [2]
p array_diff([1,2,2], [1]) == [2,2]
p array_diff([1,2,2], [2]) == [1]
p array_diff([1,2,2], []) == [1,2,2]
p array_diff([], [1,2]) == []
