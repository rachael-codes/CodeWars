# Program: Backspaces in string
# Date: 02/14/21
# Code Wars: https://www.codewars.com/kata/5727bb0fe81185ae62000ae3/solutions/ruby/me/best_practice
# Kyu: 6 

# Algo
# -initialize an empty string and split string into an array of characters
# -iterate over array of characters with index and...
#    -if the character is a # sign, reassign the empty string to the slice of the first index 
#     through the character right before the # sign
#    -if not, add the character to the empty string
# -return the empty string 

# My solution
def clean_string(str)
  result = ''
  arr = str.chars 
  
  arr.each_with_index do |char, idx|
    if char == '#' 
      result = result.slice(0..-2)
    else 
      result << char 
    end 
  end 
  
  result
end 

# Shorter solution that takes a similar approach 
def clean_string(string)
  string.chars.reduce('') { |result, c| c == '#' ? result.chop : result << c }
end

# each_with_object solution (Jesus Castello) that takes similar approach but uses an array instead of empty str
def clean_string(str)
  str.chars.each_with_object([]) { |ch, o| ch == "#" ? o.pop : o << ch }.join
end

# TEST CASES
p clean_string('abc#d##c') == "ac"
p clean_string('abc####d##c#') == ""
p clean_string("abc#d##c") == "ac"
p clean_string("abc##d######")  ==  ""
p clean_string("#######") ==  ""