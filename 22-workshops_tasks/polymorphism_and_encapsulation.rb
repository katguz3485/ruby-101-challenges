class Person
  def initialize()

  end

  def say_something
    "something"
  end
end

class Parent < Person

  def say_something
    "I am adult"
  end


end

class Child < Person

  #metody mozna uzywac wewnatrz klasy
  def say_something
    # "I am not"
    #super + "sth"
    age
  end

  private

  def age
    12
  end

end

child = Child.new
puts child.say_something

