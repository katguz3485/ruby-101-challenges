require 'rails'
require 'pp'
require 'pry'
# Deadfish has 4 commands, each 1 character long:

# i increments the value (initially 0)
# d decrements the value
# s squares the value
# o outputs the value into the return array
# Invalid characters should be ignored.
#
class DeadFish
  def parse(text)
    output = []
    counter = 0

    text.each_char do |char|
      counter += 1 if char == "i"
      counter -= 1 if char == "d"
      counter **= 2 if char == "s"
      output << counter if char == "o"
    end
    output
  end
end


df = DeadFish.new
pp df.parse("iiisdoso")

# parse("iiisdoso")  ==>  [8, 64]