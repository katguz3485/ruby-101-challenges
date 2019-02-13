class Animal

  attr_accessor :owner, :genre, :noise

  def initialize(owner, genre, noise)
    @owner = owner
    @genre =  genre
    @noise = noise
  end

  def speak
    puts sound
  end

end

class Dog < Animal


  def initialize(owner, genre, noise)
    super(owner, genre, noise)
    @noise = noise
  end

  def noise
    puts define_sound
  end

  private

  def define_sound(sound = "Wrrr")
    "I am making #{sound}"
  end
end

class Cat < Animal

  def initialize
    super(owner, genre, noise)
  end


  def noise
   "Miauu"
  end

end


animal = Animal.new("Owner", "mammal", "Auuu")
puts animal.owner
dog = Dog.new("Burek", "black", "")
puts dog.owner
puts dog.noise

cat = Cat.new
puts cat.noise


