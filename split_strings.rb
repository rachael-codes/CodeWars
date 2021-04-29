# Program: Split Strings
# Date: 02/15/21
# Code Wars: https://www.codewars.com/kata/515de9ae9dcfc28eb6000001
# Kyu: 6
# Instructions: Complete the solution so that it splits the string into pairs of two characters.
# If the string contains an odd number of characters then it should replace the missing second character of the final pair
# with an underscore ('_').

# input: string
# output: array that represents pairs of two from the string (if odd, last one should be the last item + underscore)

# implicit:
# -if empty, return empty array
# -all lowercase
# -no punctuation or special chars

# D: array

# Algo for solution 1
# 1. initialize empty result array and split string into chars
# 2. count string length; if odd, pop last character and store it in final character; add an underscore to this
# 3. split up the chars into pairs (ab, bc, cd, de, etc.) then select the pairs with an even index (to skip unwanted items)
# 4. map over the pairs to join them into strings
# 5. if the final char is more than just an underscore, add this to the final result array
# 6. return result array

# Algo for solution 2 (better)
# 3. use each_slice instead of each_cons to get slices without having to select just ones at correct indices

# First solution
def solution(string)
  result = []
  letters = string.chars

  final_char = ''
  final_char = letters.pop if string.size.odd?
  final_char << '_'

  result = letters.each_cons(2).to_a.select.with_index { |sub, idx| idx.even? }.map!(&:join)
  result << final_char if final_char.size > 1
  result
end

# Improved solution
def solution2(string)
  letters = string.chars
  letters << '_' if letters.size.odd?
  letters.each_slice(2).to_a.map!(&:join)
end

# TEST CASES
p solution('abc') == ['ab', 'c_']
p solution('abcdef') == ['ab', 'cd', 'ef']
p solution("abcdefg") == ["ab", "cd", "ef", "g_"]
