# Program: Substring fun
# CodeWars: https://www.codewars.com/kata/565b112d09c1adfdd500019c/train/ruby
# Kyu: 7
# Date: 02/05/21

=begin
Complete the function that takes an array of words.

You must concatenate the nth letter from each word to construct a new word which should be returned as a string, where n is the position of the word in the list.

For example:

["yoda", "best", "has"]  -->  "yes"
  ^        ^        ^
  n=0     n=1     n=2
Note: Test cases contain valid input only - i.e. a string array or an empty array; and each word will have enough letters.
=end

# input: array
# string that represents the joined chars from certain elements from the input array 

# implicit 
# -return empty array if input is empty string 
# -preserve case 

# D: string 

# Algo
# -initialize empty string
# -iterate over array with index and add to empty string the character at that index value
# -return string

# My solution
def nth_char(arr)
  result = ''
  arr.each_with_index { |word, idx| result += word[idx] }
  result
end 

# Another solution 
def nth_char(words)
  words.map.with_index{|x,i| x[i]}.join
end

# TEST CASES
p nth_char(['yoda', 'best', 'has']) == 'yes' # y = index 0 of word 0, e = index 1 of word 1, s = index 2 of word 2
p nth_char([]) == '' 
p nth_char(['X-ray']) == 'X' # if only one word (word 0), return just index 0 
p nth_char(['No', 'No']) == 'No' # preserve case 
p nth_char(['Chad', 'Morocco', 'India', 'Algeria', 'Botswana', 'Bahamas', 'Ecuador', 'Micronesia']) ==  'Codewars'
