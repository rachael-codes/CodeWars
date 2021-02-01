# Program: Mexican Wave
# Date: 01/31/21

# Algorithm
# -initialize an empty array
# -find the length of the string (n) and add a duplicate of the string to the empty array n times 
# -iterate over the array one by one and change the index of the first element to upcase, then the second
#  index of the second element to upcase, and so on...
# -delete any elements in the array that are unchanged copies of the string (the # of these will equal 
#  the # of spaces in the string)
# -return the array 

def wave(str)
  result = []
  
  str.size.times do
    result << str.dup
  end
  
  result.each_with_index do |word, index|
    word[index] = word[index].upcase
  end
  
  result.delete(str)
  result
end 

# Another good solution from Code Wars 
def wave2(str)
  result = []
  chars = str.downcase.chars
  chars.each_with_index do |char, idx|
    next if char == " "
    result << str[0...idx] + char.upcase + str[idx+1..-1]
  end
  result
end

# TEST CASES
wave("hello") == ["Hello", "hEllo", "heLlo", "helLo", "hellO"]
wave(" hello ") == [" Hello ", " hEllo ", " heLlo ", " helLo ", " hellO "]