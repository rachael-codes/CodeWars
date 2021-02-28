
=begin

Program: Reversing and Combining Text
Code Wars: https://www.codewars.com/kata/56b861671d36bb0aa8000819/train/ruby
Kyu: 6 

Date: 02/28/21

Your task is to Reverse and Combine Words.
Input: String containing different "words" separated by spaces

1. If the input has more than one word? Reverse each word and combine first with second, third with fourth and so on...
  (odd number of words => last one stays alone, but has to be reversed too)
2. Start it again until there's only one word without spaces
3. Return your result…
=end 


# ALGORITHM 
# -Split string into array of words 
# -Guard clause: return string if array is only one word long (for edge case on line #48)

# -Create a loop 
#   -continuously reassign the result words array to the return value of calling reverse on each word (w/ map) then slicing
#    the words into chunks of two and re-joining the chunks of 2 together 
#   -break out of the loop once the resulting words array only contains one word 

# -Return the only element in the result array 

def reverse_and_combine_text(string)
	result = string.split
	return string if result.size == 1

	loop do 
		result = result.map { |word| word.reverse }
		result = result.each_slice(2).to_a.map(&:join)
		break if result.size == 1
	end 

	result.first
end 

# TEST CASES
p reverse_and_combine_text("abc def") == "cbafed"
p reverse_and_combine_text("abc def ghi jkl") == "defabcjklghi"
p reverse_and_combine_text("dfghrtcbafed") == "dfghrtcbafed"
p reverse_and_combine_text("234hh54 53455 sdfqwzrt rtteetrt hjhjh lllll12  44") == "trzwqfdstrteettr45hh4325543544hjhjh21lllll"
p reverse_and_combine_text("sdfsdf wee sdffg 342234 ftt") == "gffds432243fdsfdseewttf" # "gffds432243fdsfdseewttf"

