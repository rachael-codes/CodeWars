# Program: Find the Mine! 
# Date: 02/11/21
# Code Wars: https://www.codewars.com/kata/528d9adf0e03778b9e00067e/train/ruby
# Kyu: 6

=begin 
You've just discovered a square (NxN) field and you notice a warning sign. 
The sign states that there's a single bomb in the 2D grid-like field in front of you.

Write a function mineLocation/MineLocation that accepts a 2D array, and returns the location of the mine. The mine is represented as the integer 1 in the 2D array. Areas in the 2D array that are not the mine will be represented as 0s.

The location returned should be an array (Tuple<int, int> in C#) where the first element is the row index, and the second element is the column index of the bomb location (both should be 0 based). All 2D arrays passed into your function will be square (NxN), and there will only be one mine in the array.
=end

# input: an array containing 3 subarrays 
# output: an array that contains two integers representing the indices of the row and column with the #1

# explicit: 
# -there will only be one #1 (the mine)

# implicit:
# -all subarrays will be same length but the length varies 

# Data Structure example 
# [0, 0, 0] 
# [0, 1, 0]
# [0, 0, 0]

# Algo
# -initialize row and column variables to zero 
# -nested iteration 
#   -iterate over array of subarrays 
#      -assign row variable to the subarray index in which 1 is located 
#     -iterate over elements within each subarray 
#       -assign column variable to element index that equals 1 
# return array containing row and column 

def mineLocation(array)
  row = 0
  column = 0

  array.each_with_index do |subarray, idx|
    row = idx if subarray.include?(1)
    subarray.each_with_index do |integer, idx|
      column = idx if integer == 1 
    end 
  end 

  [row, column] 
end 

# TEST CASES
p mineLocation( [ [1, 0, 0], [0, 0, 0], [0, 0, 0] ] ) == [0, 0] # row 0 column 0
p mineLocation( [ [0, 0, 0], [0, 1, 0], [0, 0, 0] ] ) == [1, 1] # row 1 column 1 
p mineLocation( [ [0, 0, 0], [0, 0, 0], [0, 1, 0] ] )  == [2, 1] # row 2 column 1 
p mineLocation([ [1, 0], [0, 0] ]) == [0, 0] # row 0 column 0 
p mineLocation([ [1, 0, 0], [0, 0, 0], [0, 0, 0] ]) == [0, 0] # row 0 column 0 
p mineLocation([ [0, 0, 0, 0], [0, 0, 0, 0], [0, 0, 1, 0], [0, 0, 0, 0] ]) == [2, 2] # row 2 column 2
