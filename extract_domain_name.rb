# Code Wars: https://www.codewars.com/kata/514a024011ea4fb54200004b/train/ruby
# Program: Extract the domain name from a URL
# Date: 02/08/21
# Kyu: 5 

# Write a function that when given a URL as a string, parses out just the domain name and returns it as a string. 

# Algo
# -slice into subarray; slice when we encounter a / or a .
# -delete extraneous periods 
# -iterate over the elements and return the element that comes after the / or www 

def domain_name(str)
  result = ''

  subs = str.chars.slice_when { |char| char == '/' || char == '.' }.to_a
  subs.map! { |sub| sub.join.delete('.') }

  subs.each_with_index do |_, idx|
    if (subs[idx] == 'www' || subs[idx] == '/') && subs[idx+1] != 'www'
      result += subs[idx+1]
      break
    end 
  end 

  result
end 

p domain_name("http://google.com") == "google"
p domain_name("http://google.co.jp") == "google"
p domain_name("www.xakep.ru") == "xakep"
p domain_name("https://youtube.com") == "youtube"
p domain_name("https://www.cnet.com") == "cnet"
