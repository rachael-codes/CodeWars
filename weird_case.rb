# Program: Weird Case
# CodeWars: https://www.codewars.com/kata/52b757663a95b11b3d00062d
# Kyu: 6
# Date: 02/18/21

# Instructions: Write a function called weirdcase that accepts a string, and returns the same 
# string with all even indexed characters in each word upper cased, and all odd indexed characters in each word 
# lower cased. The indexing just explained is zero based, so the zero-ith index is even, therefore that character 
# should be upper cased.

# Algo
# 1. create a method to convert just one word to weird case...
#  -split words into chars + iterate over chars w/ idx 
#    -if idx is even, transform char to char.upcase 
#    -else, transform char to char.downcase 
#  -join chars back into word
# 2. iterate over strings of words w/ transformation and change each word into the return value of calling
#    method 1 on the word
#    -join words back together w/ one space between words 

# Solution
def weirdcase_oneword(word)
  word.chars.map.with_index { |chr, idx| idx.even? ? chr.upcase : chr.downcase }.join
end 

def weirdcase(str)
  str.split.map! { |word| weirdcase_oneword(word) }.join(' ')
end 

# TEST CASES
p weirdcase( "String" ) == "StRiNg" #StRiNg
p weirdcase( "Weird string case" ) == "WeIrD StRiNg CaSe"