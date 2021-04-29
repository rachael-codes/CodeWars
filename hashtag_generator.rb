# Program: The Hashtag Generator
# Code Wars: https://www.codewars.com/kata/52449b062fb80683ec000024
# Kyu: 5
# Date: 02/14/21

# Instructions
# The marketing team is spending too much time typing in hashtags. Let's help with a Hashtag Generator!

# Explicit reqs (contained within instructions):
# --It must start with a hashtag (#).
# --All words must have their first letter capitalized.
# --If the final result is longer than 140 chars it must return false.
# --If the input or the result is an empty string it must return false.

# input: string
# output: string

# Algo
# --split string into array of words
# --iterate over words and capitalize each one
# --insert a hashtag at the beginning and join all of the words together with no space in-between
# --if the result is over 140 chars or less than or equal to 1, return false; else, return result

# Initial solution
def generateHashtag(string)
  arr = string.split
  arr.map! { |word| word.capitalize }
  result = arr.insert(0, '#').join('')

  if result.size > 140 || result.size <= 1
    return false
  else
    return result
  end
end

# Refactored
def generateHashtag(string)
  result = string.split.map!(&:capitalize).insert(0, '#').join('')
  (result.size > 140 || result.size <= 1) ? false : result
end

# TEST CASES
p generateHashtag("Do We have A Hashtag") #== "#DoWeHaveAHashtag"
p generateHashtag("Codewars") == "#Codewars"
p generateHashtag("Codewars Is Nice") == "#CodewarsIsNice"
p generateHashtag("Codewars is nice") == "#CodewarsIsNice"
p generateHashtag("code" + " " * 140 + "wars") == "#CodeWars"
p generateHashtag("") == false
p generateHashtag(" " * 200) == false
