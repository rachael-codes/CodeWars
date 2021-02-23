# Problem from Watching Others Code Part 3
# Link: https://dkq85ftleqhzg.cloudfront.net/watch_others_code/watch_others_code_part_3.mp4
# Date: 02/21/21

# Source -- Code Wars: https://www.codewars.com/kata/54521e9ec8e60bc4de000d6c
# Kyu: 5 

# INSTRUCTIONS 
# The max sum subarray problem consists in finding the max sum of a contiguous sub-sequence in an array of integers.
# [-2, 1, -3, 4, -1, 2, 1, -5, 4] should be [4, -1, 2, 1]
# -if array if made up of only negative numbers, return 0 instead

# PEDAC 
# input: array
# output array (if a sequence gets added up and is greater than 0) or 0 otherwise

# Key data structure: array of slices (mapped over to convert to sums)

# Algo
# -return 0 if array is empty 
# -initialize array to contain slices of various subsequences
# -add all slices to array 
# -iterate over the slices and transform each into the summed version of itself; get max
# -if max is greater than 0, return max; else return 0

def max_sequence(arr)
	return 0 if arr.empty? 

	array_of_combos = []

	0.upto(arr.size-1) do |start|
		1.upto(arr.size-start) do |ending|
			array_of_combos << arr[start, ending]
		end
	end 
	
	max = array_of_combos.map { |sub| sub.inject(:+) }.max
	max > 0 ? max : 0
end 


# TEST CASES
p max_sequence([]) == 0
p max_sequence([4, -1, 2, 1]) == 6 #(4 + -1 + 2 + 1 == 6) 
p max_sequence([-32]) == 0 
p max_sequence([-2, 1, -7, 4, -10, 2, 1, 5, 4]) == 12 #(2 + 1 + 5 + 4 == 12)

