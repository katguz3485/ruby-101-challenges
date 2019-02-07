require 'pry'
require 'pp'

module CheeseBurger
  def cost
    super + 10
  end
end

module LargeBurger
  def cost
    super + 15
  end
end

class Burger
  def cost
    50
  end
end


pp burger = Burger.new #=> cost = 50
pp burger.extend(CheeseBurger) #=> cost = 60
pp burger.extend(LargeBurger) #=> cost = 75
