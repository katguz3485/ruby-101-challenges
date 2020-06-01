module YeOlde
  def hello(subject = "World")
    if defined?(super)
      super
    else
      puts "Good morrow, #{subject}!"
    end
    puts "Well met indeed!"
  end
end

class Greeter
  def hello(subject)
    puts "Hello, #{subject}"
  end
end

class GreeterChild < Greeter
  include YeOlde
end

class NonGreeter
  include YeOlde
end

GreeterChild.new.hello("Bob")
NonGreeter.new.hello("Sally")


module Logged
  def logged_send(name, *args, &block)
    puts "Sending #{name}(#{args.map(&:inspect).join(", ")})"
    original_send = Object.instance_method(:send)
    bound_send = original_send.bind(self)
    bound_send.call(name, *args, &block)
    # send(name, *args, &block)
  end
end

class GreeterSecond
  include Logged
  include PigeonPost

  def hello(subject)
    puts "Hello #{subject}"
  end
end

module PigeonPost
  def send(*messaes)
    puts "Your message is winging its way to its recipient!"
  end
end

GreeterSecond.new.logged_send(:hello, "Kasia")
# original_send = Object.instance_method(:send)
# #=> #<UnboundMethod: Object(Kernel)#send>
# bound_send = original_send.bind(self)
# bound_send.call(name, *args, &block)