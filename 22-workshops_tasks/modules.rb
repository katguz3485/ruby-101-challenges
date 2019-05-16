module ModuleExample
  def print
    puts "Hello World"
  end

  def self.print
    puts "Hello from module"
  end
end

class ClassWithModule
  include ModuleExample
end

example = ClassWithModule.new
puts example.print
puts ModuleExample.print
