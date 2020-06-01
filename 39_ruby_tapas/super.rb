# class Parent
#   def bye(subject = "Kasia")
#     puts "Bye, #{subject}"
#   end
#
# end
#
# class Child < Parent
#   def bye(subject)
#     super()
#     puts "See you tommorow"
#   end
# end

# class Child < Parent
#   def bye(subject)
#     super(subject)
#     puts "See you tommorow"
#   end
# end

# puts Child.new.bye("bye")
#


# class Parent
#   def hello(subject="World")
#     puts "Hello, #{subject}"
#     if block_given?
#       yield
#       puts "Well, nice seeing you!"
#     end
#   end
# end
#
# class Child < Parent
#   def hello(subject=:default)
#     if subject == :default
#       super()
#       puts "How are you today?"
#     else
#       super(subject)
#       puts "How are you today?"
#     end
#   end
# end
#
# Child.new.hello(:default) do
#   puts "Hi there, Child!"
# end
#

class Parent
  def hello(subject="World")
    puts "Hello, #{subject}"
    if block_given?
      yield
      puts "Well, nice seeing you!"
    end
  end
end

class Child < Parent
  def hello(subject=:default)
    if subject == :default
      super(&nil)
      puts "How are you today?"
    else
      super(subject, &nil)
      puts "How are you today?"
    end
  end
end

Child.new.hello(:default) do
  puts "Hi there, Child!"
end
