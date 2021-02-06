# Code Wars Problem: Repeated Substring 
# Kyu: 6
# Link: https://www.codewars.com/kata/5491689aff74b9b292000334/train/ruby
# Date: 02/06/21

# PEDAC 
# input: string
# output: array containing 1 string and 1 integer that reps number of times the string occurs

# explict:
# string consists of lowercase latin letters

# Algo
# -initialize empty array
# -slice the string into substrings in which the letter on the left is earlier in the alphabet than the letter on 
#  the right 
# -sort the subs by size
# -count the number of times this occurs in the substring array and add this number to the empty array 
# -return the array

def f(str)
  result = []

  sub_strings = str.chars.slice_when { |a, b| a > b }.to_a
  longest_sub = sub_strings.sort_by { |sub| sub.size }[-1].join

  rejoined_subs = sub_strings.map! { |sub| sub.join }
  count = rejoined_subs.count(longest_sub)

  result << longest_sub << count
end 

# TEST CASES
p f("ababab") == ["ab", 3]
p f("abcde") == ["abcde", 1]