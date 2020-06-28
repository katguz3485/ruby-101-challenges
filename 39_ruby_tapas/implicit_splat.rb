a = [:first, :second, :third, :fourth]
x, y, z = *a

#2.7.1 :072 > a = [:first, :second, :third, :fourth]
# 2.7.1 :073 > x, y, z = *a
# 2.7.1 :074 > x
#  => :first
# 2.7.1 :075 > y
#  => :second
# 2.7.1 :076 > z
#  => :third
#
require 'set'
a = [:first, :second, :third, :fourth]
s = Set.new(a)
s.to_a
x, y, z = s
# => #<Set: {:first, :second, :third, :fourth}>
# 2.7.1 :082 > y
#  => nil
# 2.7.1 :083 > z
#  => nil
# 2.7.1 :084 >
#
# 2.7.1 :084 > x, y, z = *s
# 2.7.1 :085 > x
# => :first
# 2.7.1 :086 > y
# => :second
# 2.7.1 :087 > z
# => :third
# 2.7.1 :088 >

h = { :orange => :juice,
      :apple  => :cider,
      :lemon  => :lemonade }

h.each do |key, value|
  puts "#{key}: #{value}"
end

#orange: juice
# apple: cider
# lemon: lemonade
#  => {:orange=>:juice, :apple=>:cider, :lemon=>:lemonade}
#
h = { :orange => :juice,
      :apple  => :cider,
      :lemon  => :lemonade }

h.each do |arg|
  puts arg.inspect
end

#[:orange, :juice]
# [:apple, :cider]
# [:lemon, :lemonade]
#  => {:orange=>:juice, :apple=>:cider, :lemon=>:lemonade}
#
h = { :orange => :juice,
      :apple  => :cider,
      :lemon  => :lemonade }

h.each do |*pair|
  puts pair.inspect
end

#[[:orange, :juice]]
# [[:apple, :cider]]
# [[:lemon, :lemonade]]

pair   =         [:apple, :cider]
pair

def yield_pair
  yield([:foo, :bar])
end

yield_pair do |*pair|
  puts pair.inspect
end


*pair   = :_,    [:apple, :cider]
#2.7.1 :118 > pair
#  => [:_, [:apple, :cider]]
