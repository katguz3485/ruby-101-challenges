require 'pp'

def create_array(n)
  (1..n).to_a
end

def shuffle(array)
  array.shuffle
end

def first_element
  create_array(10).first
end

def last_element
  create_array(10).last
end

def find_index
  create_array(10).find_index(7)
end

def highest_value
  create_array(10).max
end

def lowest_value
  create_array(10).min
end

def result
  %w[one two three].map { |x| puts x.upcase }
  # puts is mapped to nil => compare output without puts
  %w[one two three].map { |x| x.upcase }
end

pp create_array(10)
pp array = shuffle(create_array(10))
pp first_element
pp find_index
pp highest_value
pp lowest_value
pp result