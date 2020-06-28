assoc = [[:foo, 42], [:bar, 23]]
value = assoc.each do |entry|
  if entry.first == :bar
    break entry.last
  end
end

123.hash
"hello".hash
"goodbye".hash
:foo.hash

# /2.7.1 :007 > 123.hash
#  => 2689614777231669859
# 2.7.1 :008 > "hello".hash
#  => -4567967945022228572
# 2.7.1 :009 > "goodbye".hash
#  => -3612914234898799073
# 2.7.1 :010 > :foo.hash
#  => 4515532228612832889
#
#require "./feet"
#
class Feet
  def initialize(number)
    @number = number
  end
end

b0 = []
b1 = []
b2 = [] # !> assigned but unused variable - b2

one = Feet.new(1)
two = Feet.new(2)

123.hash % 3 # => 1
"hello".hash % 3 # => 2
"goodbye".hash % 3 # => 2
:foo.hash % 3 # => 1
one.hash % 3 # => 2
two.hash % 3 # => 2

x = "x"

def x.hash
  333;
end

y = "y"

def y.hash
  100;
end

z = "z"

def z.hash
  999;
end

x.hash % 3 # => 0
y.hash % 3 # => 1
z.hash % 3 # => 0

b0 << x # => ["x"]
b1 << y # => ["y"]
b0 << z # => ["x", "z"]

b0.detect{|entry| entry == x}