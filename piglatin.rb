# Code Wars
# Kata - 5
# # https://www.codewars.com/kata/520b9d2ad5c005041100000f

# Program: Simple Pig Latin
# Date: 01/12/21

# Move the first letter of each word to the end of it, then add "ay" to the end of the word.
# Leave punctuation marks untouched.

def pigIt(str)
  pigged_arr = []
  words = str.split
  words.each do |word|
    if word.match?(/[A-Za-z]/)
      pigged_arr << word.slice(1..-1) + word.slice(0) + 'ay'
    else
      pigged_arr << word
    end
  end
  pigged_arr.join(' ')
end

# TEST CASES
p pigIt('Pig latin is cool') # igPay atinlay siay oolcay
p pigIt('Hello world !')    # elloHay orldway !
