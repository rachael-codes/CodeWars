# Program: Are they the 'same'? 
# Code Wars: https://www.codewars.com/kata/550498447451fbbd7600041c
# Date: 02/20/21
# Kyu: 6

# Instructions: Given two arrays a and b write a function comp(a, b) that checks whether the two arrays have the "same" 
# elements, with the same multiplicities. "Same" means, here, that the elements in b are the elements in a squared, regardless 
# of the order.

# input: two arrays
# output: boolean

# D: arrays

# ALGORITHM 
# -account for edge cases (array sizes not being equal or an array being nil) 
# -sort each array 
# -initialize index counter to 0
# -loop
#    -return false if what's at index 0 of arr1 times itself doesn't equal what's at index 0 of arr2
#    -increment counter 
#    -keep looping until all elements have been looked at 
# -return true if loop finishes iterating without false being returned 

def comp(arr1, arr2)
	return false if arr1 == nil || arr2 == nil || arr1.size != arr2.size 

	first = arr1.sort 
	second = arr2.sort 
	counter = 0
	
	until counter == arr1.size
		return false if first[counter] * first[counter] != second[counter] 
		counter += 1 
	end 

	true 
end 

# Good solution from Code Wars
def comp(a=[], b=[])
  return false if a.nil? || b.nil?
  a.sort.map { |i| i**2 } == b.sort
end

# Another good one 
def comp (array1, array2)
  !array1.nil? && !array2.nil? && array1.sort.zip(array2.sort).all?{|a, b| a**2 == b}
end

# TEST CASES
p comp([121, 144, 19, 161, 19, 144, 19, 11], [121, 14641, 20736, 361, 25921, 361, 20736, 361]) == true
p comp([121, 144, 19, 161, 19, 144, 19, 11] , [132, 14641, 20736, 361, 25921, 361, 20736, 361]) == false
p comp(nil, [1, 2, 3]) == false
p comp([1, 2], []) == false
p comp([1, 2], [1, 4, 4]) == false
