
# Program: Two Sum
# Code Wars Kata: 6
# Link: https://www.codewars.com/kata/52c31f8e6605bcc646000082/train/ruby

# Instructions:
# Write a method that takes an array of numbers (integers for the tests) and a target number. 
# It should find two different items in the array that, when added together, give the target value. 
# The indices of these items should then be returned in a tuple like so: (index1, index2).

# For the purposes of this kata, some tests may have multiple answers; any valid solutions will be accepted.
# The input will always be valid (numbers will be an array of length 2 or greater, and all of the items will 
# be numbers; target will always be the sum of two different items from that array).

=begin PEDAC 
P E 

- write a method that takes two parameters: param1 is an array, param2 is an integer
- it should find two different items in the array that, when added together equal param2
- the indices of these items should be returned as a tuple

implicit:
  - there will only be positive numbers

explicit:
  - input will always be valid
  - param1 will always be an array of length 2 or greater
  - all of the items will be integers
  - param2 will always be the sum of two different items from param1

input
  - two arguments
    1. param1 = an array of integers
    2. param2 = an integer which is the target number

output
  - 2-element array, with each index corresponding to the two integers that added together equal 
    the target number (param2)

D
  -Arrays

Algo for initial attempt below 
  1. initialize two counters that will be used to reference array indices

  2. INNER LOOP 
  -loop over array and check if the array element at index counter1 + the element at index counter2
    equal the target number
  -skip to the next element if counter1 and counter2 are equal 
   (since we don't want to check for the result of a counter added to itself)
  -keep incremeting the second counter by one until it iterates over all of the items in the array
  - break the loop when this counter reaches the last index within the array

  3. OUTER LOOP
  -nest this inner loop within an outer loop 
  -again, make sure to skip to the next element if counter1 is equal to counter2 
  -increment the first counter by one so it's now at index 1 rather than index 0 
  -keep incrementing by 1 until the counter reaches the second-to-last index within the array (break)
=end

# version 1 (my initial attempt) 
def two_sum(array, target_number)
  counter1 = 0 
  counter2 = 1
  
  loop do
    next if counter1 == counter2

    loop do 
      next if counter1 == counter2
      if array[counter1] + array[counter2] == target_number
        return [counter1, counter2]
      end 
      counter2 += 1 
      break if counter2 == array.size - 1
    end 
    
    break if counter1 == array.size - 2
    counter1 += 1 
  end 
end

# Algo for version 2 (the better answer)
# -OUTER LOOP: loop over array (both numbers themselves and their indices)
# -INNER LOOP: loop over array (both numbers themselves and their indices)
#   -move to the next pair of numbers if the index is the same for outer num and inner num
#     (since we don't want to check for the result of a number added to itself)
#   -check if the number in the inner loop and the number in the outer loop add up to the target
#     -if so, return the indices of these two numbers

# version 2 (James' better answer)
def two_sum2(array, target)
  array.each_with_index do |number, index|
    array.each_with_index do |number2, index2|
      next if index == index2
      if number + number2 == target
        return [index, index2]
      end
    end
  end
end

# TEST CASES
p two_sum2([1234, 5678, 9012], 14690) == [1, 2] 
p two_sum2([2, 2, 3], 4) == [0, 1]   
p two_sum2([4, 4, 8, 8], 16) == [2, 3]