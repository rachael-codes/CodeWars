# Program: Most frequently used words in a text
# Date: 02/07/21
# Code Wars: https://www.codewars.com/kata/51e056fe544cf36c410000fb/train/ruby
# Kyu: 4

=begin
Write a function that, given a string of text (possibly with punctuation and line-breaks), returns an array of the top-3 most occurring words, in descending order of the number of occurrences.

Assumptions:
A word is a string of letters (A to Z) optionally containing one or more apostrophes (') in ASCII. (No need to handle fancy punctuation.)
Matches should be case-insensitive, and the words in the result should be lowercased.
Ties may be broken arbitrarily.
If a text contains fewer than three unique words, then either the top-2 or top-1 words should be returned, or an empty array if a text contains no words.
=end 

ALPHABET = ("a".."z").to_a

def no_letters?(string)
  chars = string.split('')
  truthy = chars.map do |char|
    ALPHABET.include?(char)
  end 
  truthy.all? { |value| value == false } 
end 

def top_3_words(string)
  result = []
  return result if no_letters?(string) == true 

  stripped_string = string.downcase.gsub(/[^a-z ']/, '')

  counts = stripped_string.split.tally.sort_by { |k, v| v }.reverse
  
  counts.each_with_index do |array, idx| 
    break if idx > 2 
    result << array[0] 
  end 

  result
end 

# TEST CASE
p top_3_words("a a a  b  c c  d d d d  e e e e e") == ["e", "d", "a"] #e occurs 5 times, d occurs 2, a occurs 3
p top_3_words("e e e e DDD ddd DdD: ddd ddd aa aA Aa, bb cc cC e e e") == ["e", "ddd", "aa"] #e occurs 7, ddd occurs 6, aa occurs 3
p top_3_words("  , e   .. ") == ["e"]
p top_3_words("  ...  ") == []
p top_3_words("  '  ") == []
p top_3_words("  '''  ") == []
p top_3_words("  //wont won't won't ") == ["won't", "wont"]