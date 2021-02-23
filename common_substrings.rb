# Watch Others Code Part 4: https://dkq85ftleqhzg.cloudfront.net/watch_others_code/watch_others_code_part_4.mp4
# Date: 02/22/21 

# Source -- CodeWars: https://www.codewars.com/kata/5669a5113c8ebf16ed00004c/train/ruby
# Kyu: 7 

# INSTRUCTIONS ------------------------------------------------------------------------------------------------------
# Given two strings, find out if there is a substring that appears in both strings. You will return true
# if you find a substring that appears in both, or false if you don't. We only care about subs longer than one letter.


# PEDAC -------------------------------------------------------------------------------------------------------------
# input: two strings
# output: boolean 

# explicit: 
# -only count substrings as being 2 letters or more (which is why second-to-last test case doesn't work)

# implicit:
# -case doesn't matter 
# -string could consist of letters or numbers 

# D: arrays 

# Algorithm 
# -get downcased versions of input strings (since case doesn't matter)
# -initialize substrings array
# -split str1 into substring slices 
# -select slices that are 2 or longer in size 
# -iterate over slices and return true if str2 includes a slice 
# -return false otherwise 

def substring_test(str1, str2)
	str1 = str1.downcase 
	str2 = str2.downcase 
	str1_subs = []

	0.upto(str1.size-1) do |start|
		1.upto(str1.size-start) do |ending|
			str1_subs << str1[start, ending]
		end
	end 

	valid_subs = str_subs.select { |sub| sub.size >= 2 }
	valid_subs.each { |sub| return true if str2.include?(sub) } 

	false 
end 

# Refactored
def substring_test(str1, str2)
	str1_subs = []
	0.upto(str1.size-1) do |idx1|
		1.upto(str1.size-idx1) do |idx2|
			str1_subs << str1[idx1, idx2].downcase if str1[idx1, idx2].size >= 2 
		end
	end 

	str1_subs.each { |sub| return true if str2.downcase.include?(sub) } 
	false 
end 

# TEST CASES
p substring_test('Something', 'Fun') == false 
p substring_test('Something', 'Home') == true # ome is in both 
p substring_test('Something', '') == false 
p substring_test('', 'Fun') == false 
p substring_test('banana', 'BANANA') == true 
p substring_test('test', 'lllt') == false 
p substring_test('1234567', '541265') == true # 12 is in both  

