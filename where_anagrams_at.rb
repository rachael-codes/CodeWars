# Program: Where my anagrams at?
# Date: 01/31/21
# Kyu: 5 
# https://www.codewars.com/kata/523a86aa4230ebb5420001e1/ruby

# Write a function that will find all the anagrams of a word from a list. 
# You will be given two inputs a word and an array with words. 
# You should return an array of all the anagrams or an empty array if there are none. 

# Algo
# -create an array that contains characters of input word; sort it 
# -create an empty array to be used for sorted strings 
# -create an empty array that will be the returned result 

# -iterate over each word in array, sorting each one + adding it to sorted array (don't alter actual values)

# -iterate over sorted array; if the subarray equals the first array, then it's a match; find its index
#  -add the original item (using its index) to the result array

# -return result array

# My solution 
def anagrams(word, arr)
  anagram_chars = word.split('').sort
  sorted_strings = []
  result = []

  arr.each do |word|
    sorted_strings << word.split('').sort
  end 

  sorted_strings.each_with_index do |word, idx|
    result << arr[idx] if word == anagram_chars
  end 

  result
end 

# Best solution (from Code Wars)
def anagrams2(word, arr)
  arr.select { |w| w.chars.sort == word.chars.sort }
end

#TEST CASES
p anagrams('abba', ['aabb', 'abcd', 'bbaa', 'dada']) == ['aabb', 'bbaa']
p anagrams('racer', ['crazer', 'carer', 'racar', 'caers', 'racer']) == ['carer', 'racer']
p anagrams('laser', ['lazing', 'lazy',  'lacer']) == []