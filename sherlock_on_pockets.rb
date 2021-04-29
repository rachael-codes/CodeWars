# Sherlock on Pockets
# Date: 03/01/21
# Code Wars: https://www.codewars.com/kata/53bb1201392478fefc000746
# Kyu: 6

# INSTRUCTIONS
# Sherlock has to find suspects on his latest case. He will use your method, dear Watson.
# Suspect in this case is a person which has something not allowed in his/her pockets.

# Allowed items are defined by array of numbers.
# Pockets contents are defined by map entries where key is a person and value is one or few things represented by an
# array of numbers (can be nil or empty array if empty).

# PEDAC
# input: array of integers that reps numbers in one's pocket
# output: array of symbols that reps names of suspects

# explicit:
# -pocket contents for each person are
#   -key = person
#   -arr = contents of the person's pocket

# ALGORITHM #1
# 1. initialize an array where suspects will get pushed

# 2. iterate over pocket hash
#   -push the person to the suspect's array UNLESS all items in the person's pockets are
#    included in the allowed array (argument #2)

# 3. return nil if suspects array is empty; else return suspects array

def find_suspects(pocket_hash, allowed_arr)
  suspects = []

  pocket_hash.each do |person, items|
    suspects << person unless items.all? { |item| allowed_arr.include?(item) }
  end

  suspects.empty? ? nil : suspects
end

pockets = {
  bob: [1],
  tom: [2, 5],
  jane: [7]
}

# Similar solution
# ALGORITHM #2
#   initialize an empty array for suspects
#   iterate over each value (item) in pockets
#     if all are in the allowed items array
#      -do nothing
#     else, push the person (key) to suspects
#   return suspects array unless it's empty; then return nil.

def find_suspects(pockets, allowed_items)
  suspects = []

  pockets.each do |person, items|
    if !(items.all? { |item| allowed_items.include?(item) })
      suspects << person
    end
  end

  suspects.empty? ? nil : suspects
end

# # TEST CASES
p find_suspects(pockets, [1, 2]) == [:tom, :jane] # 1 is allowed, so bob is safe, 2 is allowed, but Tom still has 5 and jane still has 7
p find_suspects(pockets, [1, 7, 5, 2]) == nil
p find_suspects(pockets, []) == [:bob, :tom, :jane] # no items are allowed, so everyone gets chosen
p find_suspects(pockets, [7]) == [:bob, :tom] # only jane is safe because 7 is allowed
