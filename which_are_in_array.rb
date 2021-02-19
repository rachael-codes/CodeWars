# Program: Which are in? 
# Code Wars: https://www.codewars.com/kata/550554fd08b86f84fe000a58)
# 6 kyu
# Date: 02/18/21

# input: two arrays; first = substrings to check; second = strings 
# output: array that represents which of the strings from the first array ARE, in fact, subs of the second array

# implicit:
# -strings are all just lowercase chars
# -return empty array if no strings from a1 are subs of a2 

# D -- arrays 

# Algo
# -create empty result array 
# -nested iteration...
#  -iterate over first array
#   -iterate over second array
#    -if string in first array is a substring of an item in the second array, push to result
# -return result w/ no duplicated elements + sorted 

def in_array(arr1, arr2)
  result = []

  arr1.each do |word|
    arr2.each do |word2| 
     result << word if word2.include?(word)
    end
  end 
    
  result.uniq.sort
end 

# TEST CASES
a1 = ["arp", "live", "strong"]
a2 = ["lively", "alive", "harp", "sharp", "armstrong"] 
p in_array(a1, a2) == ["arp", "live", "strong"]
  

a3 = ["tarp", "mice", "bull"]
a4 = ["lively", "alive", "harp", "sharp", "armstrong"]
p in_array(a3, a4) == [] 