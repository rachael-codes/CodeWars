# Program: Find Next Square 
# Kyu: 7 
# Date: 05/07/21
# https://www.codewars.com/kata/56269eb78ad2e4ced1000013/solutions/python

# INSTRUCTIONS 
# You might know some pretty large perfect squares. But what about the NEXT one?

# Complete the findNextSquare method that finds the next integral perfect square after the one passed as a parameter. Recall that an integral perfect square is an integer n such that sqrt(n) is also an integer.

# If the parameter is itself not a perfect square then -1 should be returned. You may assume the parameter is non-negative.

# Examples:

# findNextSquare(121) --> returns 144
# findNextSquare(625) --> returns 676
# findNextSquare(114) --> returns -1 since 114 is not a perfect square

# MY SOLUTION
import math 
def find_next_square(sq):
    current_sqr = math.sqrt(sq)
    if current_sqr % 1 == 0: 
            return (current_sqr + 1) ** 2
    else:
            return -1 

# CODEWARS TOP SOLUTIONS
import math 
def find_next_square(sq):
    return (math.sqrt(sq) + 1) ** 2 if (math.sqrt(sq)).is_integer() else -1           