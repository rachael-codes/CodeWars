# Program: Typoglycemia Generator
# Date: 02/06/20
# Code Wars
# Kyu: 5 
# Link: https://www.codewars.com/kata/55953e906851cf2441000032/train/ruby

=begin
Background
There is a message that is circulating via public media that claims a reader can easily read a message where the inner letters of each words is scrambled, as long as the first and last letters remain the same and the word contains all the letters.

Another example shows that it is quite difficult to read the text where all the letters are reversed rather than scrambled.

In this kata we will make a generator that generates text in a similar pattern, but instead of scrambled or reversed, ours will be sorted alphabetically

Requirement
return a string where:

1) the first and last characters remain in original place for each word
2) characters between the first and last characters must be sorted alphabetically
3) punctuation should remain at the same place as it started, for example: shan't -> sahn't

Assumptions

1) words are seperated by single spaces
2) only spaces separate words, special characters do not, for example: tik-tak -> tai-ktk
3) special characters do not take the position of the non special characters, for example: -dcba -> -dbca
4) for this kata puctuation is limited to 4 characters: hyphen(-), apostrophe('), comma(,) and period(.)
5) ignore capitalisation


# PEDAC 
# input: string
# output: string

# explicit:
# -letters in first and last index positions remain the same 
# -sort middle letters alphabetically
# -punctuation shouldn't move

# implicit:
# -ignore capitalization 
# -if one, two, or three letters, return original string 
# -if empty, return empty 

# Data struct - Array and Hash

# Algo
# if the size of the string is 3 or less, return the string 
# -create empty string
# -create second empty string for final char 

# -split string into array of chars with index and save the char and index position into a hash if the char is punctuation

# -shift first char into empty string (unless it's punc)
# -pop final char into second empty string (unless it's punc)

# -sort the remaining middle piece by alphabetical order and add this to first string 
# -add final char from second string to the frist, and return it 

# -insert the punctuation back into its correct index position

# -create a separate method that handles multi-word strings one-by-one

=end

PUNCTUATION = ['-', ',', '\'', '.']

def scramble_one_word(string)
  return string if string.size <= 3
  result_string = ''

  punctuation = {}
  string.each_char.with_index do |char, idx| 
    if PUNCTUATION.include?(char) 
      punctuation[char] = idx 
    end 
  end 

  letters = string.chars.reject { |char| PUNCTUATION.include?(char) } #temporarily strip punctuation
  middle_letters = letters[1..-2]
  result_string << letters[0] << middle_letters.sort.join << letters[-1]
  punctuation.each { |k, v| result_string.insert(v, k) } #re-insert punctuation if there was any

  result_string 
end 

def scramble_words(string)
  words = string.split 
  words.map! { |word| scramble_one_word(word) }.join(' ')
end 

# TEST CASES
p scramble_words('professionals') == 'paefilnoorsss' # p s 
p scramble_words('card-carrying') == 'caac-dinrrryg'
p scramble_words("shan't") == "sahn't"
p scramble_words('-dcba') == '-dbca'
p scramble_words('dcba.') == 'dbca.'
p scramble_words('i') == 'i'
p scramble_words('') == ''
p scramble_words('me') == 'me'
p scramble_words('you') == 'you'
p scramble_words("you've gotta dance like there's nobody watching, love like you'll never be hurt, sing like there's nobody listening, and live like it's heaven on earth.") == "you've gotta dacne like teehr's nbdooy wachintg, love like ylo'ul neevr be hrut, sing like teehr's nbdooy leiinnstg, and live like it's haeevn on earth."
