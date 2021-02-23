# Watch Others Code Part 5: https://dkq85ftleqhzg.cloudfront.net/watch_others_code/watch_others_code5.mp4
# Date: 02/22/21

# Program: Longest Palindrome 

# INSTRUCTIONS: Find the length of the longest substring in the given string that is the same in reverse

# ALGORITHM 
# -initialize array 
# -find all substrings and put into an array 
# -select the substrings that are the same as they are reversed (palindromes); 
#  sort by size and get the last one then return its size

def longest_palindrome(string)
	array = []

	0.upto(string.size-1) do |start|
		1.upto(string.size-start) do |ending|
			array << string[start, ending]
		end
	end 

	array.select { |str| str == str.reverse }.sort_by { |str| str.size }.last.size
end 

# TEST CASES
p longest_palindrome('a') == 1
p longest_palindrome('aab') == 2
p longest_palindrome('baabcd') == 4 
p longest_palindrome('I like racecars that go fast') == 7
p longest_palindrome('baablkj12345432133d') == 9