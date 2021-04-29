# Program: Find the Divisors!
# Date: 03/01/21
# Code Wars: https://www.codewars.com/kata/544aed4c4a30184e960010f4/solutions/ruby
# Kyu: 7

# INSTRUCTIONS
# Create a function named divisors/Divisors that takes an integer n > 1 and returns an array with all of the integer's
# divisors(except for 1 and the number itself), from smallest to largest.
# If the number is prime return the string '(integer) is prime'.

# ALGORITHM
# create a range from 2 to integer minus one => convert to array
# iterate over the array and select the elements that when divided by the input integer have a remainder of 0
# if array is empty at end of selection return string w/ string interpolation; else return array

def divisors(int)
  range = (2..int - 1).to_a.select { |num| int % num == 0 }
  range.empty? ? "#{int} is prime" : range
end

p divisors(12) == [2, 3, 4, 6]
p divisors(25) == [5]
p divisors(13) == "13 is prime"
