# Code Wars: Take a Ten Minute Walk
# Kyu: 6
# https://www.codewars.com/kata/54da539698b8a2ad76000228/solutions/ruby
# Date: 2/1/21

# PEDAC
# input: array
# output: Boolean (true or false)

# explicit
# -array will consist of one-letter strings repping directions (n, s, e, w)
# -you will walk a single block for each direction given; takes 1 minute to go 1 block
# -return true if walk takes 10 minutes and returns you to starting point

# implicit
# -length of array must equal 10; else its false

# Algo
# -return false if array's length doesn't equal 10
# -initialize n/s counter and e/w counter
# -iterate over array and for each n, add 1 to n/s counter; for reach s, minus 1
# -do same for e/w
# -if both counters == 0, return true; else, false

# My solution
def is_valid_walk(arr)
  return false if arr.size != 10

  ns_counter = 0
  ew_counter = 0

  arr.each do |direction|
    case direction
    when 'n'
      ns_counter += 1
    when 's'
      ns_counter -= 1
    when 'e'
      ew_counter += 1
    else
      ew_counter -= 1
    end
  end

  ns_counter == 0 && ew_counter == 0
end

# A good one-line solution
def isValidWalk(walk)
  walk.count('n') == walk.count('s') && walk.count('e') == walk.count('w') && walk.count == 10
end

# TEST CASES
p is_valid_walk(['n', 's', 'n', 's', 'n', 's', 'n', 's', 'n', 's']) == true
p is_valid_walk(['w', 'e', 'w', 'e', 'w', 'e', 'w', 'e', 'w', 'e', 'w', 'e']) == false
p is_valid_walk(['w']) == false
p is_valid_walk(['n', 'n', 'n', 's', 'n', 's', 'n', 's', 'n', 's']) == false
