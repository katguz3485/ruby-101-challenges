# Create a person class with at least 2 attributes and 2 behaviors.  Call all
# person methods below the class so that they print their result to the
# terminal.

#YOUR CODE HERE
class Person
  def initialize(age:, weight:, gym_visits:)
    @age = age
    @weight = weight
    @gym_visits = gym_visits
    @health = health
  end

  attr_accessor :weight, :gym

  def health
    health_status = {0 => "very poor",
                     1 => "poor",
                     2 => "average",
    3  => "good"}
    health_status[gym]
  end

  def improve_health(gym_visits)
    gym_visits unless gym_visits >=3 && gym_visits < 0
    "The value is out of range or sth like this"
  end



end

person = Person.new(age: 20, weight: 58, gym_visits: 0)
p person.improve_health(5)