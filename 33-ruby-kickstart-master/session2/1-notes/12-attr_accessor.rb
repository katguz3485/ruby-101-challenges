# In fact, this naming convention for setters and
# getters is so common that there is a method that
# will write them for you.

class Car
  attr_accessor 'miles'
end

Car.instance_methods false # => [:miles, :miles=]

car = Car.new
puts car.miles = 1000
puts car.miles # => 1000

puts car.instance_variables              # => [:@miles]
puts car.instance_variable_get '@miles'  # => 1000


# attr_accessor is an example of metaprogramming, 
# You can write methods yourself like attr_accessor
