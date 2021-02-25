# Program: Number Zoo Patrol
# Date 02/24/21
# Code Wars https://www.codewars.com/kata/5276c18121e20900c0000235/ruby
# Kyu: 6

# INSTRUCTIONS 
# Write a function that takes a shuffled list of unique numbers from 1 to n with one element missing (which can be any number including n). Return this missing number.

# PEDAC 
# input: array
# output: integer 

# Algo 
# sort the array
# create a range that starts at 1 and ends at the last element of the sorted array 
# find what's left when you take range and delete the sorted array from it (this is the missing number)
#   -if empty, return the last element of the array plus one; else, return the missing element 


def find_missing_number(arr)
	arr = arr.sort 
	range = (1..arr[-1]).to_a

	missing_num = (range - arr).first
	missing_num == nil ? (return arr[-1] + 1) : (return missing_num)
end 

p find_missing_number([1, 3, 4])  ==  2 # 1 2 3 4 
p find_missing_number([1, 2, 3])  ==  4 # 1 2 3 4 
p find_missing_number([4, 2, 3])  ==  1 # 4 2 3 1 