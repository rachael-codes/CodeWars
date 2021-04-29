# Program: Largest product in a series
# Code Wars: https://www.codewars.com/kata/529872bdd0f550a06b00026e/train/ruby
# Kyu: 5
# Date: 02/17/21

# Instructions: Complete the greatestProduct method so that it'll find the greatest product of five
# consecutive digits in the given string of digits

# Algo
# 1. split string into array then subarrays of 5 numbers each
# 2. convert all nums to inteegers
# 3. form an array called 'products' and iterate over subarrays of 5 to multply them all and find their products
# 4. initialize target index to 0 (this will be used to store index of max value from products array)
# 5. iterate over products array and find index of max, then assign this to target index
# 6. return the value from the result array of the target index (which reps the max value)

# Original solution
def greatest_product(string)
  arrays_of_5 = string.chars.each_cons(5).to_a
  arrays_of_5.map! { |five_nums| five_nums.map!(&:to_i) }

  products = arrays_of_5.map! { |nums| nums.inject(:*) }

  target_idx = 0
  products.each_with_index { |num, idx| target_idx = idx if num == products.max }
  arrays_of_5[target_idx]
end

# Refactored
def greatest_product2(string)
  string.chars.each_cons(5).map { |five_nums| five_nums.map(&:to_i).reduce(:*) }.max
end

# TEST CASES
p greatest_product("123834539327238239583") == 3240
p greatest_product("92494737828244222221111111532909999") == 5292
p greatest_product("92494737828244222221111111532909999") == 5292
p greatest_product("02494037820244202221011110532909999") == 0
