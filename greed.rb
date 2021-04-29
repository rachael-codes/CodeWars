# Program: Greed
# https://www.codewars.com/kata/5270d0d18625160ada0000e4/solutions/ruby
# Kyu: 5 
# Date: 04/29/21 

# Greed is a dice game played with five six-sided dice. 
# Your mission, should you choose to accept it, is to score a throw 
# according to these rules. You will always be given an array with 
# five six-sided dice values.

#  Three 1's => 1000 points
#  Three 6's =>  600 points
#  Three 5's =>  500 points
#  Three 4's =>  400 points
#  Three 3's =>  300 points
#  Three 2's =>  200 points
#  One   1   =>  100 points
#  One   5   =>   50 point

# A single die can only be counted once in each roll. 
# For example, a given "5" can only count as part of a triplet 
# (contributing to the 500 points) or as a single 50 points, 
# but not both in the same roll.

# Example scoring

#  Throw       Score
#  ---------   ------------------
#  5 1 3 4 1   250:  50 (for the 5) + 2 * 100 (for the 1s)
#  1 1 1 3 1   1100: 1000 (for three 1s) + 100 (for the other 1)
#  2 4 4 5 4   450:  400 (for three 4s) + 50 (for the 5)

# In some languages, it is possible to mutate the input to the function. 
# This is something that you should never do. 
# If you mutate the input, you will not be able to pass all the tests.

# -----------------------------------------------------------------------
# PEDAC
# input: array
# output: integer that represents a score

# Algo
# -initialize total to 0 
# -tally up array into numbers and number counts
# -create helper methods for ones and threes
# -add to total by passing into helper methods 
# -return total 

def score(arr)
  total = 0

  counts = tally(arr)
  counts.each do |key, value|
    total += ones(key) if value == 1
    total += ones(key) * 2 if value == 2
    total += threes(key) if value == 3
    total += threes(key) + ones(key) if value == 4
    total += threes(key) + ones(key) * 2 if value == 5
  end

  total
end

def ones(key)
  case key
  when 1 then 100
  when 5 then 50
  else 0
  end
end

def threes(key)
  key == 1 ? 1000 : (key.to_s + '00').to_i
end

def tally(arr)
  arr.each.with_object({}) do |num, hsh|
    hsh.include?(num) ? hsh[num] += 1 : hsh[num] = 1
  end
end

# TEST CASES
score([2, 2, 2, 3, 3]) == 200
score([2, 4, 4, 5, 4]) == 450