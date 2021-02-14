# different solutions 

def delete_digit(int)
  arr = int.to_s.chars
  result = []
  
  arr.each_with_index do |num, idx|
    result << arr[0...idx] + arr[idx+1..-1]
  end 
  
  result.map! { |sub| sub.join.to_i } 
  result.max
end 

## 
def delete_digit(num)
  digits = num.to_s.chars
  (0...digits.size).map { |idx| (digits[0...idx] + digits[idx + 1..-1]).join.to_i }.max
end

## 
def delete_digit(n)
  n.digits.reverse.combination(n.digits.size-1).max_by(&:join).join.to_i
end

### 
def delete_digit(n)
  digits = n.digits.reverse
  combination_argument = n.to_s.length - 1
  
 combinations = digits.combination(combination_argument).to_a

 integerized = combinations.map do |element|
   element.join.to_i
 end
  
p final = integerized.max_by do |element|
  element
end



# TO MEMORIZE 
# COMBINATION - COMBO/ORDER/LOCKED 
a = [1, 2, 3, 4]
a.combination(1).to_a  #=> [[1],[2],[3],[4]]
a.combination(2).to_a  #=> [[1,2],[1,3],[1,4],[2,3],[2,4],[3,4]]
a.combination(3).to_a  #=> [[1,2,3],[1,2,4],[1,3,4],[2,3,4]]
a.combination(4).to_a  #=> [[1,2,3,4]]
a.combination(0).to_a  #=> [[]] # one combination of length 0
a.combination(5).to_a  #=> []   # no combinations of length 5


# PERMUTATION - PARTY 
a = [1, 2, 3]
a.permutation.to_a    #=> [[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]]
a.permutation(1).to_a #=> [[1],[2],[3]]
a.permutation(2).to_a #=> [[1,2],[1,3],[2,1],[2,3],[3,1],[3,2]]
a.permutation(3).to_a #=> [[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]]
a.permutation(0).to_a #=> [[]] # one permutation of length 0
a.permutation(4).to_a #=> []   # no permutations of length 4