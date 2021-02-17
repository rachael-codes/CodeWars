# Program: Where my anagrams at?
# Date: 01/31/21
# Kyu: 5 
# https://www.codewars.com/kata/523a86aa4230ebb5420001e1/ruby

# Write a function that will find all the anagrams of a word from a list. 
# You will be given two inputs a word and an array with words. 
# You should return an array of all the anagrams or an empty array if there are none. 

# Algo
# -create an array that contains characters of input word; sort it 
# -create an empty array to be used for storing sorted strings from input array
# -create an empty array that will be the returned result 

# -iterate over each word in array, sorting each one + adding it to sorted array (don't alter actual values)

# -iterate over sorted array; if the subarray equals the target array, then it's a match; find its index
#  -add the original item (using its index) to the result array

# -return result array

# My first solution 
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

# Another solution practicing with hashes 
# Date: 02/15/21
# Algo
# 1. create hash with letters and counts for target word (input #1)
# 2. create empty array to hold target indices and another to hold the final array to be returned at the very end 
# 3. create an empty array to hold each hash that will show the letters and counts for each word in the input array (the possible anagrams)
# 4. iterate over initial input array and initialize a hash to be used during each iteration
#     -during each iteration, add to the hash the letters and counts for each word
#     -during each iteration, push this hash to the possible_anagrams array 
# 5. iterate over this array of hashes and if a hash equals the target hash (the letters/counts for the target word), 
#    add its index position(s) to indices array
# 6. iterate over target indices array and use each index position to find the anagrams; add to final result array 
# 7. return final result array 

# My solution
def anagrams2(word, arr)
  target_word_hash = {}
  word.chars.each { |letter| target_word_hash[letter] = word.chars.count(letter) }

  target_indices = []
  final_result = []
  possible_anagram_hashes = []

  arr.each do |string|
    possible_anagram_hash = {}
    string.chars.each { |letter| possible_anagram_hash[letter] = string.chars.count(letter) }
    possible_anagram_hashes << possible_anagram_hash
  end 

  possible_anagram_hashes.each_with_index { |hsh, idx| target_indices << idx if hsh == target_word_hash } 

  target_indices.each { |idx| final_result << arr[idx] } 

  final_result
end 

# Best solution (from Code Wars)
def anagrams3(word, arr)
  arr.select { |w| w.chars.sort == word.chars.sort }
end

#TEST CASES
p anagrams('abba', ['aabb', 'abcd', 'bbaa', 'dada']) == ['aabb', 'bbaa']
p anagrams('racer', ['crazer', 'carer', 'racar', 'caers', 'racer']) == ['carer', 'racer']
p anagrams('laser', ['lazing', 'lazy',  'lacer']) == []