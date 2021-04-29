# Program: Where is my parent?
# Kyu: 6
# Code Wars: https://www.codewars.com/kata/58539230879867a8cd00011c/train/ruby
# Date: 02/17/21

# Instructions:
# Mothers arranged a dance party for the children in school. At that party, there are only mothers and their
# children. All are having great fun on the dance floor when suddenly all the lights went out. It's a dark night
# and no one can see each other. But you were flying nearby and you can see in the dark and have ability to
# teleport people anywhere you want.
# -Uppercase letters stands for mothers, lowercase stand for their children, i.e. "A" mother's children are "aaaa".
# -Method input: String contains only letters, uppercase letters are unique.

# Algo
# 1. iterate over array of chars + sort by letter then group the characters into groupings by letter
# 2. iterate over groupings with transformation and sort each one then re-join them together

def find_children(str)
  grouped = str.chars.sort_by { |char| char.downcase }.group_by { |char| char.downcase }
  grouped.values.map! { |arr| arr.sort }.join('')
end

# TEST CASES
p find_children("abBA") == "AaBb"
p find_children("AaaaaZazzz") == "AaaaaaZzzz"
p find_children("CbcBcbaA") == "AaBbbCcc"
p find_children("xXfuUuuF") == "FfUuuuXx"
p find_children("") == ""
