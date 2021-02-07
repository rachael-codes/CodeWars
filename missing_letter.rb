# Program: Missing Letter
# Date: 02/07/21
# kyu: 6 
# Code Wars: https://www.codewars.com/kata/5839edaa6754d6fec10000a2

=begin
	
Write a method that takes an array of consecutive (increasing) letters as input and that 
returns the missing letter in the array.

You will always get an valid array. And it will be always exactly one letter be missing. 
The length of the array will always be at least 2.
The array will always contain letters in only one case.
=end


# My solution 
def missing_letter(array)
  target = 0
  
  array.each_with_index do |el, idx|
    break if idx == array.length - 1
    if (array[idx+1].ord - array[idx].ord) > 1  
      target += (array[idx+1].ord)
    end 
  end 
  
  (target-1).chr
end 

# Best solution using array subtraction 
def find_missing_letter(arr)
  ((arr.first..arr.last).to_a - arr).first
end

# Best solution using slice_when and next methods 
def find_missing_letter(arr)
  arr.slice_when { |a, b| a.next != b }.first.last.next
end

# TEST CASES 
p missing_letter(['a','b','c','d','f']) == 'e' 
p missing_letter(['O','Q','R','S']) == 'P'
