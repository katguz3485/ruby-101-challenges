require 'observer'
require 'pry'

class Employee2
  include Observable

  attr_reader :name, :address
  attr_reader :salary

  def initialize(name, title, salary)
    @name = name
    @title = title
    @salary = salary
  end

  def salary=(new_salary)
    @salary = new_salary
    changed
    notify_observers(self)
    binding.pry
  end
end


fred = Employee2.new("Fred", "PhD", 3000.0)
puts fred.salary=40500
puts fred.salary

