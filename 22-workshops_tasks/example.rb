class Example

  attr_reader :name
  attr_writer :name

  def initialize(name)
    @name = name
  end

  def display_name
    name
  end

  #class  method
  def self.display_name
    "class name"
  end


  #alias :name
=begin

  def get_name
    @name
  end


  def set_name=(x)
    @name = x
  end
=end


end

example = Example.new("some name")
puts example.name
puts example.name = "another name"