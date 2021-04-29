# Program: Count the Smileys
# Code Wars: https://www.codewars.com/kata/583203e6eb35d7980400002a/solutions/ruby/me/best_practice
# Kyu: 6
# Date: 03/04/21

# INSTRUCTIONS
# Given an array (arr) as an argument complete the function countSmileys that should return the total number of smiling faces.

# Rules for a smiling face:

#     Each smiley face must contain a valid pair of eyes. Eyes can be marked as : or ;
#     A smiley face can have a nose but it does not have to. Valid characters for a nose are - or ~
#     Every smiling face must have a smiling mouth that should be marked with either ) or D

# No additional characters are allowed except for those mentioned.

# Valid smiley face examples: :) :D ;-D :~)
# Invalid smiley faces: ;( :> :} :]

# PEDAC
# input: array of strings (valid or invalid smileys)
#  -valid --
#   must include: ) D (mouth) : ; (eyes)
#   *optional: - ~ (nose)
#  -invalid
#   anything else

# output: integer that reps how many valid smileys are in the input array

# REMEMBER - every string must include ) or D AND ; or :

# ALGORITHM
# initialize an array of valid features
# initialize a helper method that checks if all chars in a smiley are in the valid features array
#   AND the smiley contains a mouth (non-optional)
#   AND the smiley contains eyes (non-optional)

# initialize counter
# iterate over all smileys and if return value is true after passing smiley to helper method, add 1 to counter
# return counter

VALID_FEATURES = [':', ';', ')', 'D', '~', '-']

def valid_smiley?(smiley)
  smiley.chars.all? { |char| VALID_FEATURES.include?(char) } &&
    (smiley.chars.include?(')') || smiley.chars.include?('D')) &&
    (smiley.chars.include?(':') || smiley.chars.include?(';'))
end

def count_smileys(array)
  counter = 0
  array.each { |smiley| counter += 1 if valid_smiley?(smiley) }
  counter
end

# TEST CASES
p count_smileys([':)', ';(', ';}', ':-D']) == 2
p count_smileys([';D', ':-(', ':-)', ';~)']) == 3
p count_smileys([';]', ':[', ';*', ':$', ';-D']) == 1
p count_smileys([":)", ":(", ":D", ":O", ":;"]) == 2
