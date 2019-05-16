# Define following classes: Dog, Cat, Fox. Those animals should have name, color and (optionally) sound.
#   Implement a method speak which will sound like those animals (i.e. every dog can make "Woof woof", but there may be one which make "wrr").
#      Try to you use encapsulation and inheritance.

class Dog
  attr_accessor :name, :color

  def initialize
    @name = name
    @color = color
  end

  def make_sound(sound)
    sound_maker(sound)
  end


  private

  def sound_maker(sound)
    puts "I am making #{sound}"
  end
end

class Cat < Dog
  attr_accessor :sound

  def initialize
    super
    @sound = sound
  end
end

class Fox < Dog
  attr_accessor :sound

  def initialize
    super
    @sound = sound
  end
end


dog = Dog.new
puts dog.make_sound("Woof woof")
puts dog.make_sound("Wrrrr")
dog2 = Dog.new
dog2.name = "Burek"
dog2.color = "Black"
dog2.make_sound("Woof woof")

cat = Cat.new
cat.sound = "Miau miau"
puts cat.sound


fox = Fox.new
fox.sound = "Fox Sound"
puts fox.sound
