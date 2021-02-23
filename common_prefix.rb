# Program: Common Prefix
# Watching Others Code Part 3: https://dkq85ftleqhzg.cloudfront.net/watch_others_code/watch_others_code_part_3.mp4
# Original source: https://leetcode.com/problems/longest-common-prefix/
# Date: 02/22/21

# INSTRUCTIONS 
# Write a method to find the longest common prefix string amongst an array of strings.
# If there is no common prefix, return an emtpy string ''.

# MY ALGORITHM
# -initialize target string (which will be final result)

# -get all substrings of one word 
# -delete this one word from array 

# get all possible prefixes of this word one 

# iterate over all words left in the array 
#   iterate over all prefixes of the one comparison word
#      if all words in array start with one of the prefixes, reassign target_str to the prefix
# return target string 

def common_prefix(arr)
	target_str = ''

	first_word = arr[0]
	arr.delete_at(0)

	prefixes_to_compare = []
	counter = 0
	until counter == first_word.size
		prefixes_to_compare << first_word.slice(0..counter)
		counter += 1
	end 
	
	arr.all? do |word|
		prefixes_to_compare.each { |prefix| target_str = prefix if word.start_with?(prefix) } 
	end 

	target_str
end 

# TEST CASES
p common_prefix(['flower', 'flow', 'flight']) == 'fl'
p common_prefix(['flower', 'flow', 'fliwht']) == 'fl'
p common_prefix(['dog', 'racecar', 'car']) == ''
p common_prefix(['throne', 'throne']) == 'throne'
p common_prefix(['throne', 'dungeon']) == ''
p common_prefix(['interspecies', 'interstellar', 'interstate']) == 'inters'

