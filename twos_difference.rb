# Program: Difference of Twos 
# Code Wars: https://www.codewars.com/kata/5340298112fa30e786000688/solutions/ruby
# Kyu: 6 
# Date: 02/24/21

# INSTRUCTIONS
# The objective is to return all pairs of integers from a given array of integers that have a difference of 2.
# The result array should be sorted in ascending order of values.
# Assume there are no duplicate integers in the array. The order of the integers in the input array should not matter.

# My solution 
def difference_of_2(arr)
	result = []

	counter = 0
	until counter == arr.size 
		arr.each { |num| result << [num, arr[counter]] if arr[counter] - num == 2 } 
		counter += 1
	end 

	result.sort 
end 

# Another one of my solutions 
# Algo
# -iterate over input arr 
# -check if arr includes the number + 2 
#   -if so, push the number and number + 2 to a result array
# -return sorted result array 

def twos_difference(arr)
	arr.each_with_object([]) do |num, twos|
		twos << [num, num+2] if arr.include?(num+2)
	end.sort
end 

# Good Code Wars solution
def twos_difference(arr)
  arr.sort.combination(2).select { |a, b| b - a == 2 }
end

p difference_of_2([1, 2, 3, 4]) == [[1, 3], [2, 4]]
p difference_of_2([1, 23, 3, 4, 7]) == [[1, 3]]