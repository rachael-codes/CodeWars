# Program: Pete, the Baker
# Date: 02/14/21
# Code Wars: https://www.codewars.com/kata/525c65e51bf619685c000059/train/ruby
# Kyu: 5

# Instructions
# find out how many cakes one can bake given ingredients + amounts 

# input: hash that reps the recipe + hash that reps available ingredients 
# output: integer that reps # of cakes that can be baked 

# Data struct: hashes

# Algo
# -make empty result hash 
# -sort the two input hashes
# -return 0 if the keys in each input hash don't match after they're sorted 

# -nested hashes
#  -iterate over recipe hash by each ingredient/amount
#    -iterate over ingredient hash by each ingredient/amount
#      -add to result hash the ingredient as the key + the value of dividing the available amount by the recipe amount 

# -sort the result hash by value then return the first/smallest value 

def cakes(recipe_hash, ingred_hash)
  result = {}
  recipe_hash = recipe_hash.sort.to_h
  ingred_hash = ingred_hash.sort.to_h
  return 0 if recipe_hash.keys != ingred_hash.keys 

  recipe_hash.each do |recipe_ingred, recipe_amount| 
    ingred_hash.each do |available_ingred, available_amount|
      result[available_ingred] = available_amount/recipe_amount
    end
  end 

  result.sort_by { |_, v| v }.first.last
end 


# TEST CASES
p cakes({"flour"=>500, "sugar"=>200, "eggs"=>1},{"flour"=>1200, "sugar"=>1200, "eggs"=>5, "milk"=>200}) == 0
p cakes({"cream"=>200, "flour"=>300, "sugar"=>150, "milk"=>100, "oil"=>100},{"sugar"=>1700, "flour"=>20000, "milk"=>20000, "oil"=>30000, "cream"=>5000}) == 11
p cakes({"apples"=>3, "flour"=>300, "sugar"=>150, "milk"=>100, "oil"=>100},{"sugar"=>500, "flour"=>2000, "milk"=>2000}) == 0
p cakes({"apples"=>3, "flour"=>300, "sugar"=>150, "milk"=>100, "oil"=>100},{"sugar"=>500, "flour"=>2000, "milk"=>2000, "apples"=>15, "oil"=>20}) == 0
p cakes({"eggs"=>4, "flour"=>400},{}) == 0
p cakes({"apples"=>3, "flour"=>300, "sugar"=>150, "milk"=>100, "oil"=>100},{"sugar"=>500, "flour"=>2000, "milk"=>2000, "apples"=>15, "oil"=>20}) == 0 
p cakes({"cream"=>1, "flour"=>3, "sugar"=>1, "milk"=>1, "oil"=>1, "eggs"=>1},{"sugar"=>1, "eggs"=>1, "flour"=>3, "cream"=>1, "oil"=>1, "milk"=>1}) == 1
