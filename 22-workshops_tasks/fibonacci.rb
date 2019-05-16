# fibonacii sequence with recursion vs iteration comparison

require 'pp'
require 'pry'

def fibonacci(n)
  return 0 if n == 0
  return 1 if n == 1
  return fibonacci(n - 1) + fibonacci(n - 2) if n > 1
end


start = Time.now
pp fibonacci(5)
pp fibonacci(10)
pp fibonacci(12)
finish = Time.now

diff = finish - start
puts diff



def fibonacci_iterative(n); end

start1 = Time.now
pp fibonacci_iterative(5)
pp fibonacci_iterative(10)
pp fibonacci_iterative(12)
finish2 = Time.now

puts diff = finish2 - start1