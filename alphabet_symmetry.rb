# Program: Alphabet Symmetry
# Date: 2/2/21
# Code Wars
# Kata: 7
# https://www.codewars.com/kata/59d9ff9f7905dfeed50000b0

# Given an array of words, return an array of the number of letters that occupy their positions in the alphabet for each word. For example,

# Algo
# -initialize total and empty array
# -iterate over each string in array and check each char's index against its index in the ALPHABET
#  -if the indicies match, add 1 to total
#  -add the total for the first string to the result array then reset total
# -do this for each string

ALPHABET = %W(a b c d e f g h i j k l m n o p q r s t u v w x y z)

def solve(arr)
  result = []
  total = 0

  arr.each do |str|
    str.split('').each_with_index do |char, idx|
      total += 1 if ALPHABET[idx] == char.downcase
    end
    result << total
    total = 0
  end

  result
end

# TEST CASES
p solve(["abode", "ABc", "xyzD"]) == [4, 3, 1]
p solve(["abide", "ABc", "xyz"]) == [4, 3, 0]
p solve(["IAMDEFANDJKL", "thedefgh", "xyzDEFghijabc"]) == [6, 5, 7]
p solve(["encode", "abc", "xyzD", "ABmD"]) == [1, 3, 1, 3]
