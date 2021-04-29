# Program: Dubstep
# Date: 02/08/21
# Code Wars: https://www.codewars.com/kata/551dc350bf4e526099000ae5/solutions/ruby
# Kyu: 6

# Program: Return the words of the initial song someone used to make a dubsteb remix. Separate words with a space.

def song_decoder(str)
  str.split('WUB').join(' ').squeeze(' ').strip
end

# TEST CASES
p song_decoder("WUBWEWUBAREWUBWUBTHEWUBCHAMPIONSWUBMYWUBFRIENDWUB") == "WE ARE THE CHAMPIONS MY FRIEND"
p song_decoder("AWUBBWUBC") == "A B C"
p song_decoder("AWUBWUBWUBBWUBWUBWUBC") == "A B C"
p song_decoder("WUBAWUBBWUBCWUB") == "A B C"
