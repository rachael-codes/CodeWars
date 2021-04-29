# Code Wars: Max Number
# Date: 01/16/21
# Source: https://www.codewars.com/kata/5a4ea304b3bfa89a9900008e
# Program, Given a number , Return _The Maximum number _ could be formed from the digits of the number given .

# PEDAC
# input = integer
# output = integer

# explicit
# - Only natural numbers passed to the function , numbers Contain digits [0:9] inclusive
# - Digit duplications could occur

# TEST CASE
# - maxNumber (213) ==> return (321)
# - maxNumber (7389) ==> return (9873)
# - maxNumber (63729) ==> return (97632)

# Algo
# - convert the number into an array
# - sort the elements from largest to smallest
# - rejoin the array and return it

def max_number(int)
  digits = int.digits
  digits = digits.sort do |a, b|
    b <=> a
  end
  digits.join.to_i
end

# TEST
p max_number(213) == 321
p max_number(7389) ==  9873
p max_number(63729) == 97632
