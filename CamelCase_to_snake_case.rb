
# Program: CamelCase to snake_case
# Code Wars
# Date: 02/12/21
# Complete the function/method so that it takes CamelCase string and returns the string in snake_case 
# notation. Lowercase characters can be numbers. If method gets number, it should return string.

# Completed during SPOT session with Iuliu (url unknown)

# My solution
def to_underscore(string)
  string = string.to_s
  words = string.chars.slice_before { |a| a.match? /[A-Z]/ }.to_a
  words.map! { |sub| sub.join }
  words.join('_').downcase
end 

# Version w/ regex that basically uses regex for slice_before  
def to_underscore2(string)
  string = string.to_s
  string.split(/(?=[A-Z])/).join('_')
end 

# TEST CASES
p  to_underscore('MoviesAndBooks') == 'movies_and_books' 
p  to_underscore('TestController') == 'test_controller' 
p to_underscore('App7Test') == 'app7_test'
p '1' == to_underscore(1) 