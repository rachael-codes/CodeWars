# Program: Longest Common Subsequence
# Date: 03/03/21
# Code Wars: https://www.codewars.com/users/rachael-codes/completed
# Kyu: 5

# INSTRUCTIONS
# Write a function called LCS that accepts two sequences and returns the longest subsequence
# common to the passed in sequences.
# A subsequence is different from a substring. The terms of a subsequence need NOT be consecutive terms of the original sequence.

# PEDAC
# input: two strings
# output: string that reps the longest subsequence that occurs in each string

# Algorithm
# -find each subsequence in each input string
# -initialize subs1 variable and subs2 variable to hold these
# -find size of shorter input string (if 1 is smaller or equal to 2 then return 1's size; else return 2's size)

# -initialize counter to 1
# loop
# 	-find all subsequences w/ combination method (passing incounter) then push these to the subs1 empty array
# 	-do same for string2/subs2
#   -increment counter
#   -break when counter > shorter string's size

# iterate over each array and rejoin each subarray back into a string then flatten each out so you don't have to deal
#  with a ton of nesting!

# find which elements aren't shared by subtracting string2 from string1 (or vice versa)
# subtract not shared elements from string1 and return the last element (which will be the longest)
# *or return an empty string if subs1 minus not shared elements is empty! (rather than nil)

def find_shorter_string_size(string1, string2)
  string1.size >= string2.size ? string2.size : string1.size
end

def lcs(string1, string2)
  subs1 = []
  subs2 = []
  counter = 1
  shorter_size = find_shorter_string_size(string1, string2)

  until counter > shorter_size
    subs1 << string1.chars.combination(counter).to_a
    subs2 << string2.chars.combination(counter).to_a
    counter += 1
  end

  subs1 = subs1.each { |subsequence| subsequence.map!(&:join) }.flatten
  subs2 = subs2.each { |subsequence| subsequence.map!(&:join) }.flatten

  not_shared = subs1 - subs2
  (subs1 - not_shared).last.nil? ? '' : (subs1 - not_shared).last
end

# TEST CASES
p lcs("abcdef", "abc") == "abc"
p lcs("acf", "abcdef") == "acf"
p lcs("132535365", "123456789") == "12356"
p lcs('', '') == ''
