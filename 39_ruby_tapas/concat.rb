class Concat

  def shovel_operator
    shopping_list = ['tomato', 'milk', 'cheese']
    shopping_list << 'bread'
    shopping_list << ["swiss", "brie", "cheddar"]
    shopping_list.flatten
  end

  def append_with_plus_and_equal
    shopping_list = ['tomato', 'milk', 'cheese']
    shopping_list += ["bread"]
    shopping_list += ["swiss", "brie", "cheddar"]
  end

end

class Shopper
  def initialize(list)
    @list = list
  end

  # attr_reader :list
  attr_accessor :list
end

# s = Shopper.new(["bread", "milk", "granola"])
# puts s.list += ["swiss", "brie", "cheddar"]
#
# shared_list = ["bread", "milk", "granola"]
# stacey = Shopper.new(shared_list)
# avdi   = Shopper.new(shared_list)
# stacey.list += ["swiss", "brie", "cheddar"]
# stacey.list                     # => ["bread", "milk", "granola", "swiss", "brie", "cheddar"]
# avdi.list                       # => ["bread", "milk", "granola"]
# stacey.list.object_id           # => 4977680
# avdi.list.object_id             # => 4977820
#
#
class Shopper
  def initialize(list)
    @list = list
  end

  attr_accessor :list
end

# shared_list = ["bread", "milk", "granola"]
# stacey = Shopper.new(shared_list)
# avdi   = Shopper.new(shared_list)
# stacey.list.concat(["swiss", "brie", "cheddar"])
# stacey.list                     # => ["bread", "milk", "granola", "swiss", "brie", "cheddar"]
# avdi.list
# puts stacey.list.object_id           # => 4977680
# puts avdi.list.object_id
require 'benchmark'

Benchmark.bm do |bm|
  bm.report("<<+flatten:  ") do
    list = ["bread", "milk", "granola"]
    1000.times do
      list << ["swiss", "brie", "cheddar"]
      list.flatten!
    end
  end
  bm.report("+=:          ") do
    list = ["bread", "milk", "granola"]
    1000.times do
      list += ["swiss", "brie", "cheddar"]
    end
  end
  bm.report("#concat:     ") do
    list = ["bread", "milk", "granola"]
    1000.times do
      list.concat(["swiss", "brie", "cheddar"])
    end
  end
end

