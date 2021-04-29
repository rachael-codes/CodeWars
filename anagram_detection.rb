# Program: Anagram Detection
# Kyu: 7
# Date: 02/17/21
# Code Wars: https://www.codewars.com/kata/529eef7a9194e0cbc1000255
# Return true if the two arguments given are anagrams of each other; return false otherwise

def is_anagram(str1, str2)
  str1.downcase.chars.sort.join == str2.downcase.chars.sort.join
end

p is_anagram('Creative', 'Reactive') == true
p is_anagram("foefet", "toffee") == true
p is_anagram("Buckethead", "DeathCubeK") == true
p is_anagram("Twoo", "WooT") == true
p is_anagram("dumble", "bumble") == false
