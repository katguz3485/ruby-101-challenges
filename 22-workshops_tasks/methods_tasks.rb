require 'pp'

# array from 1..20 , choose elements divided by  3 and multiply to the 3rd power, then chosse maximum value last two elements
#

def create_array
  array = (1..20).to_a
end

def elements_div_by_3
  array.select { |x| x % 3 == 0 }
end

def pow_by_3
  array.map { |x| x**3 }
end

def calculate(x)
  (1..20).to_a.select { |a| a % x == 0 }.map { |a| a**x }.sample(2).max
end

# sort data by age asc and return n-limit last elements
# [{name: "Jon", age: 18}]

@data = [{ name: "Arya", age: 12 },
         { name: "Jon", age: 18 },
         { name: "Maciej", age: 99 }]

# array_of_hashes.sort_by { |hsh| hsh[:zip] }

def vip_users(data, limit)
  data.sort_by { |hsh| hsh[:age] }.last(limit)
end

puts vip_users(@data, 1)


# fibonacii sequence with recursion
def fibonaci(n)
  return 0 if n == 0
  return 1 if n == 1
  return fibonaci(n - 1) + fibonaci(n - 2) if n > 1
end

start = Time.now
pp fibonaci(100)
finish = Time.now

diff = finish - start
puts diff


# fibonacii without recursion



