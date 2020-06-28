class C
  def self.foo
    puts "Who needs instances, I'm a class method!"
  end
end

# 2.7.1 :064 > C.foo
# Who needs instances, I'm a class method!s
#
s = "Bob"

def s.greet
  puts "Hi I'm #{self}"
end


#2.7.1 :071 > s.greet
# Hi I'm Bob
#  => nil

class MyClass
  puts "Hello from #{self}"
end

#Hello from MyClass
#  => nil
#
class C
  def C.foo
    puts "Who needs instances, I'm a class method!"
  end

  def C.bar
    puts "I'm a class method too!"
  end
end


class C
  def self.foo
    puts "Who needs instances, I'm a class method!"
  end

  def C.bar
    puts "I'm a class method too!"
  end

  class << self
    def baz
      puts "Just another class method"
    end

    def foo_2
      puts "I'm a class method too!"
    end
  end
end

C.baz
C.foo_2

# /2.7.1 :124 > C.baz
# Just another class method
#  => nil
# 2.7.1 :125 > C.foo_2
# I'm a class method too!
#  => nil

class C
  class << self
    def foo
      puts "Who needs instances, I'm a class method!"
    end

    def bar
      puts "I'm a class method too!"
    end

    def baz
      puts "Just another class method"
    end
  end
end

C.baz
#Just another class method
#  => nil