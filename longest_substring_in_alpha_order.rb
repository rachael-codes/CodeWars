# Program: Longest alphabetical substring
# https://www.codewars.com/kata/5a7f58c00025e917f30000f1)
# Level: 6 kyu

=begin
Instructions...
Find the longest substring in alphabetical order.
Example: the longest alphabetical substring in "asdfaaaabbbbcttavvfffffdf" is "aaaabbbbctt".
There are tests with strings up to 10 000 characters long so your code will need to be efficient.
The input will only consist of lowercase characters and will be at least one letter long.
If there are multiple solutions, return the one that appears first.
=end

# Algo
# -get all substring slices of string that occur in alphabetical order
# -find the longest one (or if there are two of equal length, the one that occurs first)
# -return this longest one as a string

# SOLUTION ONE
def longest(string)
  array_of_substrings = string.chars.slice_when { |a, b| a > b }.to_a
  array_of_substrings.max_by { |substring| substring.length }.join
end

# SOLUTION TWO
def longest(string)
  current_substring = ''
  longest_substring = ''

  string.each_char.with_index do |char, index|
    if index == 0
      current_substring << char
    elsif char >= current_substring[-1]
      current_substring << char
    else
      longest_substring = current_substring if current_substring.size > longest_substring.size
      current_substring = char
    end
  end

  if current_substring.size > longest_substring.size
    longest_substring = current_substring
  end

  longest_substring
end

# SOLUTION THREE w/ a separate method that just first finds ALL substrings
def find_substrings(string)
  result = []

  0.upto(string.size - 1) do |index|
    1.upto(string.size - index) do |length|
      result << string[index, length]
    end
  end

  result
end

def longest(string)
  substrings = find_substrings(string)

  only_alphabetically_ordered = substrings.select do |substring|
    substring.chars == substring.chars.sort
  end

  only_alphabetically_ordered.max_by { |substring| substring.length }
end

# TEST CASES
p longest('asd') == 'as' # as
p longest('nab') == 'ab' # ab
p longest('abcdeapbcdef') == 'abcde'
p longest('asdfaaaabbbbcttavvfffffdf') == 'aaaabbbbctt'
p longest('asdfbyfgiklag') == 'fgikl'
p longest('z') == 'z'
p longest('zyba') == 'z'
