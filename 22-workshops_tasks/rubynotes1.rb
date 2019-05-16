require 'pp'
require 'pry'
# procs
class Greeter
  def to_proc
    proc do |item|
      puts "Hello, #{item}"
    end
  end
end

greet = Greeter.new
%w[world life].each(&greet)


letter_counts = %w[just some words].map(&:length)
puts letter_counts

p ['rabbit', 'grass'].map(&:upcase)

output = method :p
['rabbit', 'grass'].map(&output)


def block_caller
  puts "some code"
  yield
  puts "other code"
end

block_caller { puts "My own block" }

def block_caller
  puts "some code"
  if block_given?
    yield
  else
    puts "default"
  end
  puts "other code"
end

block_caller

class Application
  def configuration
    @configuration ||= Configuration.new
    block_given? ? yield(@configuration) : @configuration
  end
end

class Configuration
end
app = Application.new
app.configuration do |config|
  puts config.class.name
end

pp app.configuration

my_variable = 8
3.times do |_x|
  puts "#{my_variable} bloc"
end

puts my_variable

array = (1..10).to_a
puts array.inspect

array.reverse_each do |val|
  puts val.to_s
end

class NaturalNumbers
  include Enumerable

  def initialize(upper_limit)
    @upper_limit = upper_limit
  end

  def each(&block)
    0.upto(@upper_limit).each(&block)
  end
end

n = NaturalNumbers.new(6)
pp n.reduce(:+)
pp n.select(&:even?)
pp n.map { |number| number**2 }


[[1, 2], [3, 4]].each { |(a, b)| p "a: #{a}", "b: #{b}" }

{ a: 123, b: 1234 }.each { |pair| p "pair #{pair}" }

{ a: 1, b: 2, c: 3 }.each { |(k, _v)| p "k: #{k}", "v: #{k}" }

[1, 2, 3].map.with_index { |e, i| puts "Element of array number #{i} => #{e}" }
[1, 2, 3].map.with_index(1) { |e, i| puts "Element of array number #{i} => #{e}" }

arr = [1, 2, 3]
pp arr.map { |i| i + 1 }
pp arr

# exceptions
#
class CustomError < StandardError
  attr_reader :safe_to_retry

  def initialize(safe_to_retry = false, message = 'something went wrong')
    @safe_to_retry = safe_to_retry
    super(message)
  end
end


begin
  puts "OK"
rescue StandardError => e
  retry if e.safe_to_retry
end

# enumerators

a = b = 1
fibonacci = Enumerator.new do |yielder|
  loop do
    yielder << a
    a, b = b, a + b
  end
end

arr = fibonacci.take 10
pp arr[0]
pp arr[1]
pp arr[9]

arr2 = (1..5).to_a
arr2.inject(0) do |sum, x|
  puts x
  sum = sum + x
  pp sum
end

# singleton
class Thing
end

thing1 = Thing.new
thing2 = Thing.new

def thing1.makestuff
  puts "I belong to thing one"
end

thing1.makestuff
# thing2.makestuff


class Thing
  class << self # the anonymous class
    def hello(name)
      puts "Hello #{name}"
    end
  end
end

Thing.hello("sarah")


