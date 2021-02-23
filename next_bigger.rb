
# Watch Others Code Video 2: https://dkq85ftleqhzg.cloudfront.net/watch_others_code/watch_others_code_2.mp4
# Source - Code Wars: https://www.codewars.com/kata/55983863da40caa2c900004e/train/ruby
# Kyu: 4 
# Date: 02/22/21

# INSTRUCTIONS
# Create a method that takes a pos integer and returns the next bigger number formed by same digits

# 12 -> 21
# 513 -> 531
# 2017 -> 2071
# If no bigger number can be formed, return -1 

# PEDAC 
# input: integer
# output: integer that reps the next bigger num made with the same digits

# explicit: 
# -return -1 if a bigger number can't be made 
# **GET NEXT BIGGEST NUMBER, NOT OVERALL BIGGEST

# Key data structure: array of permutations 

# Algo
# -convert integer to string 
# -get all permutations of the number that are the same size (same number of digits); rejoin into integers then sort 
# -iterate over permutations and find the one that comes after the input when input is converted to a string 
# -return this back in integer form OR return -1 if no bigger num was found 

# NOTE: THIS METHOD IS SLOW/INEFFICIENT! It passed tests on Code Wars but fails the efficiency test.

# My way 
def next_bigger(int)
	target_index = nil

	string = int.to_s
	sorted_perms = string.chars.permutation(string.size).to_a.map(&:join).sort

	sorted_perms.each_with_index do |num_string, idx|
		target_index = idx+1 if num_string == int.to_s
	end 

	sorted_perms[target_index].to_i == 0 ? -1 : sorted_perms[target_index].to_i
end 

# Way from video (also too slow to pass Code Wars test)
def next_bigger2(int)
	max = max_num(input)
	(input + 1..max).to_a.each do |num|
		return num if max == max_num(num)
	end 
	return -1 
end

def max_num(input)
	input.to_s.chars.sort.reverse.join.to_i
end 

p next_bigger(9) == -1
p next_bigger(12) == 21
p next_bigger(513) == 531
p next_bigger(2017) == 2071
p next_bigger(111) == -1
p next_bigger(123456789) == 123456798
p next_bigger(2071) == 2107
