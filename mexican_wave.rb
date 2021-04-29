# Program: Mexican Wave
# Date: 01/31/21

# Algorithm
# 1. initialize an empty array

# 2. find the length of the string (n) and add a duplicate of the string to the empty array n times

# 3. iterate over the array one by one and change the first index of the first duplicate to upcase, then the second
#  index of the second duplicate to upcase, and so on...

# 4. delete any elements in the array that are unchanged copies of the string (the number of these will equal
#  the number of spaces in the string)
# 5. return the array

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

    result << str[0...idx] + char.upcase + str[idx + 1..-1]
  end
  result
end

# TEST CASES
wave("hello") == ["Hello", "hEllo", "heLlo", "helLo", "hellO"]
wave(" hello ") == [" Hello ", " hEllo ", " heLlo ", " helLo ", " hellO "]
