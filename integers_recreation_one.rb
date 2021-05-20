# Program -- Integers: Recreation One
# Kyu: 5 
# Date: 05/19/21 
# https://www.codewars.com/kata/55aa075506463dac6600010d/ruby

# INSTRUCTIONS
# Find all integers between m and n (m and n integers such as 1 <= m <= n) 
# such that the sum of their squared divisors is itself a square. 

# MY ALGORITHM 
# create an empty result array
# create a list of numbers between m and n
# iterate over numbers and transform each one into an array of its divisors 
# iterate over each array of divisors and use map to square each integer then sum each array all together 
# iterate over sums with index...
# - if the sum is a square, add the original num that created it and the sum to the result arr
# return the result array

# MY SOLUTION WORKS BUT TIMES OUT (INEFFICIENT)
def list_squared(m, n)
	result = [] 

	nums = (m..n).to_a
	divisor_arrs = nums.map { |num| get_divisor_arr(num) }
	
	sums = divisor_arrs.map do |divisor_arr|
		divisor_arr.map { |divisor| divisor * divisor }.sum
	end 

	sums.each_with_index do |sum, idx| 
		result << [nums[idx], sum] if is_square?(sum) 
	end 

	result 
end 

def is_square?(num)
	(Math.sqrt(num) % 1).zero?
end 

def get_divisor_arr(num)
	divisors = []

	counter = num 
	while counter > 0 
		divisors << counter if num%counter == 0 
		counter -= 1
	end 

	divisors
end 

# TEST CASES
list_squared(1, 250) == [[1, 1], [42, 2500], [246, 84100]]
list_squared(42, 250) == [[42, 2500], [246, 84100]]
