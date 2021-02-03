# Longest Vowel Chain
# Date 2/2/21
# Code Wars 
# Kyu: 7
# https://www.codewars.com/kata/59c5f4e9d751df43cf000035/train/ruby

# Program: The vowel substrings in the word 'codewarriors' are o,e,a,io. 
# The longest of these has a length of 2. 
# Given a lowercase string that has alphabetic characters only and no spaces, 
# return the length of the longest vowel substring. Vowels are any of aeiou.

# Algorithm 
# -divide string up into substrings, splitting at each non-vowel 
# -iterate over each substring and delete any consonants 
# -sort the substrings by size and return the size of the substring at the last index (the longest one)

def longest_vowel_chain(str)
  slices = str.chars.slice_when { |char| !'aeiou'.include?(char )}.to_a
  slices.map! do |sub| 
    sub.each do |char|
      sub.delete(char) if !'aeiou'.include?(char)
    end 
  end 
  slices.sort_by { |arr| arr.size }[-1].size
end 

# TEST CASES
p longest_vowel_chain("iuuvgheaae") == 4
p longest_vowel_chain("ultrarevolutionariees") == 3
p longest_vowel_chain("chrononhotonthuooaos") == 5
p longest_vowel_chain("iiihoovaeaaaoougjyaw") == 8