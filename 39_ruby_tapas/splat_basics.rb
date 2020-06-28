a1 = [:first, :second, :third, :fourth]
a2 = [:before, a1, :after]
a2

a1 = [:first, :second, :third, :fourth]
a2 = [:before, a1, :after]
a2.flatten

a2 = [:before, *a1, :after]

a1 = [:first, :second, :third, :fourth]
x, y, z = *a1

#2.7.1 :036 > x
#  => :first
# 2.7.1 :037 > y
#  => :second
# 2.7.1 :038 > x
#  => :first
# 2.7.1 :039 >
#
a1 = [:first, :second, :third, :fourth]
x, y, z = :before, *a1

#x                               # => :before
# y                               # => :first
# z                               # => :second
#
a1 = [:first, :second, :third, :fourth]
*x, y, z = *a1

#*x, y, z = *a1
# x                               # => [:first, :second]
# y                               # => :third
# z                               # => :fourth
# x, *y, z = *a1
# x                               # => :first
# y                               # => [:second, :third]
# z                               # => :fourth
# x, y, *z = *a1
# x                               # => :first
# y                               # => :second
# z                               # => [:third, :fourth]


def sum3(x, y, z)
  x + y + z
end

triangle = [90, 30, 60]
sum3(*triangle)


def greet(greeting, *names)
  names.each do |name|
    puts "#{greeting}, #{name}"
  end
end

greet("Good morning", "Grumpy", "Sneezy", "Dopey")

def random_draw(num_times, num_draws)
  num_times.times do
    draws = num_draws.times.map { rand(10) }
    yield(*draws)
  end
end

random_draw(5, 3) do |first, second, third|
  puts "#{first} #{second} #{third}"
end

#3 6 7
# 0 8 3
# 7 4 9
# 6 4 1
# 6 2 7
#  => 5
#
def random_draw(num_times, num_draws)
  num_times.times do
    draws = num_draws.times.map { rand(10) }
    yield(*draws)
  end
end

random_draw(5, 3) do |first, *rest|
  puts "#{first}: #{rest.inspect}"
end

# 9; [8, 5]
# 2; [9, 4]
# 7; [5, 0]
# 9; [3, 0]
# 9; [3, 6]