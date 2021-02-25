# Program: Scramblies
# Code Wars: https://www.codewars.com/kata/55c04b4cc56a697bb0000048/train/ruby)
# 5 kyu
# DATE: 02/21/21

# INSTRUCTIONS 
# Complete the function scramble(str1, str2) that returns true if a portion of str1 characters can be rearranged to match str2, 
# otherwise returns false.
# Only lower case letters will be used (a-z). No punctuation or digits will be included.

# PEDAC 
# input: string 1 and string 2
# output: boolean (true if a portion of str1 chars can be rearranged to match str2) 

# explicit: 
# -only lowercase; no punctuation 

# D: arrays 

# Algo
# -initialize result to true 
# -iterate over the chars in string 2 and check if each char's amount when counted is less than or equal to string 1's counts of that same char
#    -if not, change result to false  
# -return result 

# My solution (which Code Wars said was too slow)
def scramble3(str1, str2)
	result = true 

  str2.chars.each do |char| 
    if !(str1.chars.count(char) >= str2.chars.count(char))
      result = false  
    end
  end 
  
  result
end

# Another simpler solution from me
def scramble(str1, str2)
	str2.chars.each { |char| return false if !(str1.count(char) >= str2.count(char)) } 
	true 
end 

# Another Code Wars solution
def scramble2(s1,s2)
  s2.chars.uniq.all? {|x| s2.count(x) <= s1.count(x)}
end

# TEST CASES
p scramble('lddwordasdf', 'world') == true 
p scramble('lddwordasdf', 'oworld') == false 
p scramble('cedewaraaossoqqyt','codewars') == true




