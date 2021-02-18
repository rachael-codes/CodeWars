# Program: Multiples of 3 or 5
# Date: 02/17/21
# Code Wars: https://www.codewars.com/kata/514b92a657cdc65150000006/train/ruby
# Kyu: 6 
# Instructions: return the sum of all the multiples of 3 or 5 below the number passed in as an argument 

# PEDAC 
# input: integer
# output: integer that reps sum of all multiples of 3 or 5 below the # passed in as the input 

# explicit: only count each num once (i.e. 15 should be added once, not twice)
# implicit: don't include num itself 

# D: array 

# Algo
# -initialize an array 
# -create a loop
#   -count down from input number and add to array if the num is a multiple of 3 or 5 
#   -break when loop hits 2 
# -return result of summing the array 

def solution(int)
  result = []
  counter = int-1 

  until counter < 3  
    result << counter if counter % 3 == 0 || counter % 5 == 0
    counter -= 1
  end 

  result.inject(:+)
end 

p solution(10) == 23 # 3 + 5 + 6 + 9 = 23 
p solution(20) == 78 # 3 + 5 + 6 + 9 + 10 + 12 + 15 + 18 = 78 
p solution(200) == 9168

