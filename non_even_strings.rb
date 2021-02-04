# CoderPad 
# Kim + Rachael 

# Non-even substrings

# Given a string of integers, return the number of odd-numbered substrings that can be formed.

# For example, in the case of "1341", they are 1, 1, 3, 13, 41, 341, 1341, a total of 7 numbers.

# solve("1341") = 7. See test cases for more examples.
# =end

# PEDAC 

# input: integer 

# output: integer that reps that number of odd substrings 
# that can be formed 

# D: Array of substrings

# Algo 
# -convert the string into an integer then an array 
# -find all subarrays of the array 
# -iterate over array of subarrays and join each so it's an integer
# -iterate over the array and select the ones that are odd #s
# -count the # of items in the result array 

def solve(string)
  array = string.to_i.digits.reverse
  subarrays = [] 
  
  0.upto(array.size-1) do |start|
    1.upto(array.size-start) do |ending|
      subarrays << array[start, ending]
    end
  end 
  
  subarrays.map! do |subarray|
    subarray.join.to_i
  end 
  
  odd_subs = subarrays.select { |num| num.odd? } 
  odd_subs.count
end 


p solve("1341") == 7 #1 1 3 13 41 341 1341 
p solve("1357") == 10 # 1 3 5 7 13 35 57 135 357 1357 
p solve("13471") == 12 
p solve("134721") == 13
p solve("1347231") == 20
p solve("13472315") == 28

