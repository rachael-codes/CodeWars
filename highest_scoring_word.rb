# Program: Highest Scoring Word
# https://www.codewars.com/kata/57eb8fcdf670e99d9b000272
# 6 kyu
# Date: 02/07/21

# INSTRUCTIONS 
# Given a string of words, you need to find the highest scoring word (a = 1, b = 2, c = 3, etc.). 
# If two words score the same, return the word that appears earliest in the original string.

# My solution 
ALPHABET = %w(nil a b c d e f g h i j k l m n o p q r s t u v w x y z)

def get_total(string)
  total = 0
  letters = string.chars

  letters.each do |letter|
    total += ALPHABET.index(letter)
  end 

  total
end 

def high(string)
  words = string.split
  words_copy = words.dup 
  target_index = nil

  nums = words.map { |word| get_total(word) } 

  nums.each_with_index do |num, idx|
    if num == nums.max
      target_index = idx
    end 
  end 

  words_copy[target_index]
end 

# Better solution from 3/2/21
# ALGORITHM 
# 1. create array w/ nil then a through z (so index value matches the letter's score)

# 2. create a helper method that changes one word into its num sum 
# -split words into chars + iterate over chars...
# -use map to change each char into its score; then call inject to get the sum of each

# 3. main method 
# -split original string into words 
# -create a duplicate of the string 
# -iterate over the duplicate's words w/ map to change each word to its sum (pass into helper method)
# -find the index of the max value + use this index to return the max word from the array of the original string 

SCORES = %w(nil a b c d e f g h i j k l m n o p q r s t u v w x y z)

def change_word_to_num(word)
  word.chars.map { |char| SCORES.index(char) }.inject(:+)
end 

def high(string)
  words = string.split 
  words_copy = words.dup 
  sums = words_copy.map { |word| change_word_to_num(word) }
  sums.each_with_index { |num, idx| return words[idx] if num == sums.max } 
end 

# TEST CASES
p high('take me to semynak') == 'semynak'
p high('what time are we climbing up the volcano') == 'volcano'
p high('man i need a taxi up to ubud') == 'taxi'
p high('aaa b') == 'aaa'