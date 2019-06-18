require 'pry'
# You'll get a string and a boolean.
# When the boolean is true, return a new string containing all the odd characters.
# When the boolean is false, return a new string containing all the even characters.
#
# If you have no idea where to begin, remember to check out the cheatsheets for string and logic/control
#
def odds_and_evens(string, return_odds)
  arr = string.split("")
  temp = []
  if return_odds
    arr.each_with_index {|w, index| temp << w if index.odd?}
  else
    arr.each_with_index {|w, index| temp << w if index.even?}
  end
  temp.join("")
end

# puts odds_and_evens("kasia", true)
# puts odds_and_evens("kasia", false)
# puts odds_and_evens("abcdefg", true)
# =>  "bdf"
