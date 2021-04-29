# Program: Delete occurrences of an element if it occurs more than n times
# Date: 02/28/21
# CodeWars: https://www.codewars.com/kata/554ca54ffa7d91b236000023/solutions/ruby/me/best_practice
# Kyu: 6

# Given a list lst and a number N, create a new list that contains each number of lst at most N times without
# reordering. For example if N = 2, and the input is [1,2,3,1,2,1,2,3], you take [1,2,3,1,2], drop the next [1,2]
# since this would lead to 1 and 2 being in the result 3 times, and then take 3, which leads to [1,2,3,1,2,3].

# PEDAC
# input: array + an integer that reps the max number of occurences one integer can have in the array
# output: array

# explicit:
# -preserve the order

# D - Arrays

# ALGORITHM
# -initialize a new result array
# -iterate over the input array and add each element as long as result_array.count(element) is less than the second argument
# -return the result array

def delete_nth(arr, max_num)
  arr.each_with_object([]) { |num, res| res << num if res.count(num) < max_num }
end

# TEST CASES
p delete_nth([1, 1, 1, 1], 2) == [1, 1]
p delete_nth([20, 37, 20, 21], 1) == [20, 37, 21]
