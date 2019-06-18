# Using set_whatever and get_whatever is kind of
# distracting. It's better to name your setters
# and getters the same as the variable they represent.
require 'pp'

class Car
  def miles=(miles)
    @miles = miles
  end

  def miles
    @miles
  end
end

Car.instance_methods false # => [:miles=, :miles]

pp car = Car.new
pp car.miles = 1000 # Ruby knows this is the miles= method
pp car.miles # => 1000
