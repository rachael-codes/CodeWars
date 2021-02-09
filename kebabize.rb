# Program: Kebabize 
# Code Wars: https://www.codewars.com/kata/57f8ff867a28db569e000c4a/train/ruby
# 6 kyu
# Date: 02/08/21

#Explicit: Modify the kebabize function so that it converts a camel case string into a kebab case.
#Implicit (from test case 2): strip letters (seems like a weird thing, but can account for on line 1)

# Algo
# initialize an empty array in which to store indices representing insertion points for the dashes
# initialize two counters


def kebabize(str)
  str = str.gsub(/[^a-zA-Z]/, '')
  insertion_points = []
  index_counter = 0
  index_incrementer = 0

  arr = str.split('')
  arr.each_with_index { |el, idx| insertion_points << idx if el == el.upcase }

  loop do 
    arr.insert(insertion_points[index_counter]+index_incrementer, '-')
    index_counter += 1
    index_incrementer += 1
    break if index_counter == insertion_points.size
  end 

  arr.join.downcase
end 

# TEST CASES
p kebabize('myCamelCasedString') == 'my-camel-cased-string'
p kebabize('myCamelHas3Humps') == 'my-camel-has-humps'