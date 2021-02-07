# Program: Highest Scoring Word
# https://www.codewars.com/kata/57eb8fcdf670e99d9b000272
# 6 kyu
# Given a string of words, you need to find the highest scoring word (a = 1, b = 2, c = 3, etc.). 
# Date: 02/07/21

# Most clever solution (using ASCII)
def high(x)
  x.split.max_by{ |word| word.sum - 96*word.length }
end

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

p high('take me to semynak') == 'semynak'
p high('what time are we climbing up the volcano') == 'volcano'
p high('man i need a taxi up to ubud') == 'taxi'
p high('aaa b') == 'aaa'