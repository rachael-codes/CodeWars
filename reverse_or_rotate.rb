# Program: Reverse or rotate?
# Date: 02/18/21
# Kyu: 6
# Code Wars: https://www.codewars.com/kata/56b5afb4ed1f6d5fb0000991

# INSTRUCTIONS
# The input is a string str of digits. Cut the string into chunks (a chunk here is a substring of the initial
# string) of size sz (ignore the last chunk if its size is less than sz).
# If a chunk represents an integer such as the sum of the cubes of its digits is divisible by 2,
# reverse that chunk; otherwise rotate it to the left by one position.
# Put together these modified chunks and return the result as a string.

# ALGORITHM
# 1. Make a method for rotating a string by one digit to the left
# 2. Make a method for reversing a string
# 3. Make a method for getting all subarrays
#    -slice the str into subarrays of the length n (the second input)
#    -delete any slices that aren't equal to n (to remove any trailing chars)
# 4. Make a method for getting cubes
#    -iterate over subarrays then numbers and transform each number into its cube
# 5. Main method
#    -return an empty string if the integer input is 0 or if the string size is shorter than integer
#    -gets subarrays (using pre-made method) and then cubes (pre-made method)
#    -get sums of cubes by iterating over subarrays of cubes and summing them
#    -iterate over sums of cubes and if a sum is even, replace it with the subarray from the
#     subarrays array using its index then call reverse method on it
#     -if sum is odd, replace it with its corresponding subarray and call rotate left method on it
#    -join these back together

def rotate_left(str)
  first = str.chars.shift
  str.chars.insert(-1, first)[1..-1].join
end

def reverse(str)
  str.reverse
end

def get_subarrays(str, int)
  pieces = str.chars.each_slice(int).to_a
  pieces.each { |piece| pieces.delete(piece) if piece.size != int }
end

def get_cubes(subarrays)
  subarrays.map do |subarray|
    subarray.map { |num| (num.to_i)**3 }
  end
end

def revrot(str, int)
  return '' if int == 0 || str.size < int

  subarrays = get_subarrays(str, int)
  sums_of_cubes = get_cubes(subarrays).map { |subarray| subarray.inject(:+) }

  sums_of_cubes.map.with_index do |sum, idx|
    sum.even? ? reverse(subarrays[idx].join) : rotate_left(subarrays[idx].join)
  end.join
end

p revrot("123456987654", 6) == "234561876549"
p revrot("123456987653", 6) == "234561356789"
p revrot("733049910872815764", 5) == "330479108928157" # 73304 33047(rotated) 99108 91089 (rotated) 72815 28157 (rotated)
p revrot("66443875", 8) == "64438756"
p revrot("664438769", 8) == "67834466"
p revrot("123456779", 8) == "23456771"
p revrot("", 8) == ""
p revrot("123456779", 0) == ""
