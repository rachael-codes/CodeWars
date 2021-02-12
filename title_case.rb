# Program: Title Case
# Date: 02/11/21
# Code Wars: https://www.codewars.com/kata/5202ef17a402dd033c000009
# 6 kyu

# A string is considered to be in title case if each word in the string is either: 
# (a) capitalised (that is, only the first letter of the word is in upper case) or 
# (b) considered to be an exception and put entirely into lower case unless it is the first word, 
#     which is always capitalised.

# Write a function that will convert a string into title case, given an optional list of exceptions 
# (minor words). The list of minor words will be given as a string with each word separated by a space. 
# Your function should ignore the case of the minor words string -- it should behave in the same way even 
# if the case of the minor word string is changed.

# input: two strings -- string to be made into a title + exception words
# output: first input made into a title

# explicit: 
# -make each word capital unless it's included in the exception word string
# -the first letter of the entire output string should be capital, even if it's an exception word

# implicit: 
# -if the input string contains capitals that aren't the first letter of the string, downcase them 
# -the second input string may contain capitalized exception words; downcase them 
# -the second input is optional 

# Data - Arrays

# Algo
# -put exception words into an array and downcase them
# -put string to be made into title into an array and downcase them 
# -iterate over to_be_titled array, and if word is not included in exception array, capitalize it
# -capitalize the first word in the array then re-join into string 

# Original
def title_case(str1, str2='')
  to_be_titled = str1.downcase.split 
  exception_words = str2.downcase.split 

  to_be_titled.each { |word| word.capitalize! if !exception_words.include?(word) } 
  to_be_titled.each_with_index { |word, idx| word.capitalize! if idx == 0 }.join(' ')
end 

# Slight refactor (less redundant but also less readable)
def title_case(str1, str2='')
  title = str1.downcase.split 
  exceptions = str2.downcase.split 
  title.each_with_index { |word, idx| word.capitalize! if !exceptions.include?(word) || idx == 0 }.join(' ')
end 

# TEST CASES
p title_case('a clash of KINGS', 'a an the of') == 'A Clash of Kings'
p title_case('THE WIND IN THE WILLOWS', 'The In') == 'The Wind in the Willows'
p title_case('the quick brown fox') == 'The Quick Brown Fox'
