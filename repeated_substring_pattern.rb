# Problem from Watching Others Code Part 2
# Link: https://dkq85ftleqhzg.cloudfront.net/watch_others_code/watch_others_code_part_1.mp4
# Date: 02/21/21

# INSTRUCTIONS
# Given a non-empty string check if it can be constructed by taking a substring of it
# and appending multiple copies of the substring together. You may assume the given
# string consists of lowercase English letters only.
# Example: 'abab' == true (bc it's the substring 'ab' twice)

# Algo - FIRST APPROACH
# -create an array of substrings that are combinations of the chars that are the length of half the string size
# -iterate over this array of substrings and check if when you double one, it equals the input string
#     -if so, return true; if not, false

# FIRST APPROACH
def repeated_substring_pattern(str)
  substrings = str.chars.combination(str.size / 2).to_a.map! { |sub| sub.join }
  substrings.each { |substring| return true if str == substring * 2 }
  false
end

# Algo - SECOND  APPROACH
# -find midpoint of string
# -create a pair that reps the first slice (index 0 thru midpoint) and the second slice (the rest)
# -check if what's at index 0 is same as what's at index 1

# SECOND APPROACH
def repeated_substring_pattern2(str)
  midpoint = str.size / 2 - 1
  pair = str[0..midpoint], str[midpoint + 1..-1]
  pair[0] == pair[-1]
end

# TEST CASES
p repeated_substring_pattern('abab') == true
p repeated_substring_pattern('aabaaba') == false
p repeated_substring_pattern('abaababaab') == true
p repeated_substring_pattern('abcabcabcabc') == true
p repeated_substring_pattern('aaaa') == true
