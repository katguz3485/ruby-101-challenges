# Define following classes: Dog, Cat, Fox. Those animals should have name, color and (optionally) sound.
#   Implement a method speak which will sound like those animals (i.e. every dog can make "Woof woof", but there may be one which make "wrr").
#      Try to you use encapsulation and inheritance.
require 'pry'

class Animal
  attr_accessor :name, :color, :sound

  def initialize(name, color, sound = nil)
    @name = name
    @color = color
    @sound = sound || default_sound
  end

  def speak
    puts @sound
  end

  def default_sound; end
end


class AnimalSerializer
  def initialize(animal)
    @animal = animal
  end

  def serialize
    [
      @animal.class,
      @animal.name,
      @animal.color,
      @animal.sound
    ].join(',')
  end

  def self.deserialize(text)
    array = text.split(',')
    Object.const_get(array[0]).new(array[1], array[2], array[3])
  end
end

animal = Animal.new("Animal name", "black")
puts animal.color

serialized = AnimalSerializer.new(animal).serialize
























































deserialized = AnimalSerializer.deserialize(serialized)

puts animal
puts serialized
puts deserialized


