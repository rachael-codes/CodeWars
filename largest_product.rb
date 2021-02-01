# Largest product in a series
# https://www.codewars.com/kata/529872bdd0f550a06b00026e/train/ruby)
# Level: 6 kyu
# Date: 01/31/21

# Instructions
# Complete the greatest_product method so that it'll find the greatest product of five 
# consecutive digits in the given string of digits.

# Algorithm
# -create an array of all consecutive 5-digit slice subarrays
# -convert all subarray eleements into integers
# -find the subarray that--when all of its integers are multiplied--returns the highest number
# -return this number

def greatest_product(string)
  array_of_5_digits = string.chars.each_cons(5).to_a
  
  converted = array_of_5_digits.map do |subarray|
    subarray.map { |el| el.to_i } 
  end

  result = converted.max_by do |subarray| 
    subarray.inject(:*)
  end
  
  result.inject(:*)
end


# TEST CASES
p greatest_product("123834539327238239583") == 3240 # the largest product of five consecutive digits equals the integer 3240
p greatest_product("395831238345393272382") == 3240 
p greatest_product("92494737828244222221111111532909999") == 5292
p greatest_product("92494737828244222221111111532909999") == 5292
p greatest_product("02494037820244202221011110532909999") == 0
