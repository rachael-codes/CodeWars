# Expanded Form Numbers
# Date: 02/10/21
# https://www.codewars.com/kata/5842df8ccbd22792a4000245
# Write Number in Expanded Form
# You will be given a number and you will need to return it as a string in Expanded Form.
# NOTE: All numbers will be whole numbers greater than 0.

# input: integer
# output: string that represents integer in expanded form

# explicit: no negatives or floats
# implicit: could involve any number of digits

# Algo
# -initialize empty array t
# -get length of num (digits.size) then minus 1 to find initial number of zeros to add
# -convert num to string

# -iterate over string, and for each digit add the correct number of zeros then send to empty array
# -minus one from the zero counter with each iteration

# -select the array items that are greater than 0

# -join array with (' + ') between elements and return this string

def expanded_form(int)
  result = []
  num_of_zeros = int.digits.size - 1
  int = int.to_s
  idx = 0

  until idx == int.size
    result << (int[idx] + ('0' * num_of_zeros))
    num_of_zeros -= 1
    idx += 1
  end

  result.select { |num| num.to_i > 0 }.join(' + ')
end

# TEST CASES
p expanded_form(12) == '10 + 2'
p expanded_form(42) == '40 + 2'
p expanded_form(70304) == '70000 + 300 + 4'
