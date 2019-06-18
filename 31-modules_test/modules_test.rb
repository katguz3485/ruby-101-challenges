require 'pry'

module Mod
  def hello
    15
  end
end

class Klass
  def hello
    10
  end
end

k = Klass.new
k.hello #=> "Hello from Klass.\n"
binding.pry
k.extend(Mod) #=> #<Klass:0x401b3bc8>
k.hello

