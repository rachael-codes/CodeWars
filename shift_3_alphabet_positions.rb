# Problem: Shift by 3 Alphabet Positions
# Code Wars link: unknown (problem given to me by James)
# Kyu: unknown
# Date: 03/04/21

# INSTRUCTIONS
# Change each letter 3 positions from its original placement unless its not an alphabetical character.
# Leave non-alphabetical characters alone.

# PEDAC
# input: string
# output: string

# explicit:
# -if not alphabetical, leave alone
# -if alphabetical, change 3 positions from its original placement

# implicit:
# -spaces are preserved
# -if capital, keep capital

# Algo
# - initialize a global array that contains the alphabet w/ indices

# -helper method
#   -change one word using global array
#      -iterate over the chars, if char is non-alphabetical; stay same
#      -else...
#      -find the index value of a char in the global array + w/ map
#       replace it with what char's at the index + 3 position
#       ****if index >= 24 then do subtraction instead

# -main method
#   -iterate over each word
#   -pass each into helper method + transform w/ map + rejoin

LOWER_ALPHABET = ('a'..'z').to_a.insert(0, nil)
UPPER_ALPHABET = ('A'..'Z').to_a.insert(0, nil)

def change_one(word)
  chars = word.chars

  result = chars.map.with_index do |char, idx|
    if !(LOWER_ALPHABET.include?(char.downcase))
      char
    elsif LOWER_ALPHABET.include?(char)
      target_idx = LOWER_ALPHABET.index(char)
      if (24..26).to_a.include?(target_idx)
        LOWER_ALPHABET[target_idx - 23]
      else
        LOWER_ALPHABET[target_idx + 3]
      end
    else
      target_idx = UPPER_ALPHABET.index(char)
      if (24..26).to_a.include?(target_idx)
        UPPER_ALPHABET[target_idx - 23]
      else
        UPPER_ALPHABET[target_idx + 3]
      end
    end
  end

  result.join('')
end

def letter_changes(string)
  words = string.split
  words.map { |word| change_one(word) }.join(' ')
end

# TEST CASES
p letter_changes("this long cake@&") == "wklv orqj fdnh@&"
p letter_changes("Road trip9") == "Urdg wuls9"
p letter_changes("EMAILZ@gmail.com") == "HPDLOC@jpdlo.frp"
p letter_changes('xyz') == ('abc')
