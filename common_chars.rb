# Watching Others Code Problem: https://dkq85ftleqhzg.cloudfront.net/watch_others_code/watch_others_code_part_1.mp4
# Date: 02/22/21

# INSTRUCTIONS
# Given an array of strings made of only lowercase letters, return an array fo all 
# chars that show up in all strings within the given array. If a char shows up 3 
# times but not 4, it should be included 3 times in final answer.

# PEDAC 
# input: array of strings
# output: array that reps letters that are in all strings

# Algo
# -set chars equal to the chars of the first element (and remove first el from array)
# -initialize letters placeholder and final result placeholder 
# -iterate thru chars in first word 
#   -iterate thru words in array with all?; if ALL contain char, add char to empty letters array and sub out letter in word
# -select letters with counts of 2 or higher 
# -tally up letters and counts then divide each count by size of array to get how many times it occurs in ALL words
# -this # of times, push the letter to a result array, and return result 

# My solution
def common_chars(arr)
	first = arr[0]
	arr.delete(arr[0])
	letters = []
	final_result = []

	first.chars.each do |char| 
		arr.all? { |word| letters << char && word.sub!(char, '') if word.include?(char) } 
	end 

	letters = letters.select { |char| letters.count(char) >= 2 }
	
	letters.tally.each do |k, v| 
		(v/arr.size).times { final_result << k } 
	end 

	final_result
end 

# Better solution
def common_chars2(array)
	first_word_chars = array.shift.chars 

	first_word_chars.select do |char|
		array.all? { |word| word.sub!(char, '') }
	end 
end 

p common_chars(['bella', 'label', 'roller']) == ['e', 'l', 'l']
p common_chars(['llllll', 'llll', 'llll']) == ['l', 'l', 'l', 'l']
p common_chars(['cool', 'lock', 'cook']) == ['c', 'o']
p common_chars(['hello', 'goodbye', 'booya', 'random']) == ['o']
p common_chars(['aabbaaaa', 'ccddddddd', 'boy']) == []
