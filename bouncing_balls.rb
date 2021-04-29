# Program: Bouncing Balls
# Date: 02/19/21
# Code Wars: https://www.codewars.com/kata/5544c7a5cb454edb3c000047
# Kyu: 6

# Explicit:
# -h must be greater than 0
# -b must be > 0 and < 1
# -w must be less than h
# -if all three are fulfilled, return a positive int; else return -1

# implicit:

# input: 3 ints or floats--one that reps a height, one that reps the % the ball bounces up, one that reps the
# height of the window
# output: int that represents how many times the mom saw the pass in front of her window

# Algo
# -account for explicit conditions + return -1 if they aren't all met
# -figure out how many times the ball bounces once by getting h * b and assign to a variable 'initial_bounce_height'
# -initialize counter to 1
# -loop
#     -if initial bounce height is greater than window height, increment counter by 2 + keep looping
#     -times the initial variable's number by the bounce height again
#     -break if bounce height < window height
# -return counter

def bouncingBall(h, b, w)
  return -1 if (h <= 0 || (b <= 0 || b >= 1) || w > h)

  initial_bounce_height = h * b
  counter = 1

  while initial_bounce_height > w
    counter += 2
    initial_bounce_height *= b
  end

  counter
end

# TEST CASES
p bouncingBall(3, 0.66, 1.5) == 3
p bouncingBall(30, 0.66, 1.5) == 15
p bouncingBall(30, 0.75, 1.5) == 21
p bouncingBall(30, 0.4, 10) == 3
p bouncingBall(40, 1, 10) == -1
