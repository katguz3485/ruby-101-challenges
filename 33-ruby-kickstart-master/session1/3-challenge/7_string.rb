# given a string, return the character after every letter "r"
require 'pry'
require 'pp'
# pirates_say_arrrrrrrrr("are you really learning Ruby?") # => "eenu"
# pirates_say_arrrrrrrrr("Pirates say arrrrrrrrr")        # => "arrrrrrrr"

# pirates_say_arrrrrrrrr("Katy Perry is on the radio!")   # => "rya"

def pirates_say_arrrrrrrrr(string)
  arr = string.downcase.split("")
  r_array = []
  arr.each_with_index do |elem, index|
    if elem == "r"
      r_array << index + 1
    end
  end
  final = []
  r_array.each {|x| final << arr[x]}
  return final.join("")
end


# puts pirates_say_arrrrrrrrr("are you really learning Ruby?")
# puts pirates_say_arrrrrrrrr("Pirates say arrrrrrrrr")

