# Program: Grouping and Counting
# Date: 02/22/21
# Code Wars: https://www.codewars.com/kata/53a452dd0064085711001205
# Kyu: 6

# Your goal is to write the group_and_count method, which should receive an array as a unique parameter and return a hash. 
# Empty or nil input must return nil instead of a hash. 
# This hash returned must contain as keys the unique values of the array, and as values the counting of each value.








def group_and_count(arr)
	return nil if arr == [] || arr == nil 

	
	arr.each_with_object({}) { |num. object| hsh[num] = arr.count(num) }

end

p group_and_count([1,1,2,2,2,3]) == {1=>2, 2=>3, 3=>1}
p group_and_count([]) == nil
p group_and_count(nil) == nil
p group_and_count([1, 7, 5, -1]) == {1=>1, 7=>1, 5=>1, -1=>1}
p group_and_count([0,1,1,0]) == {0=>2, 1=>2}

