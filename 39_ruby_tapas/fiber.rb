def names
  yield "Ylva"
  yield "Brighid"
  yield "Shifra"
  yield "Yesamin"
end

class MyEnumerator
  def initialize(object, method_name, *args)
    @fiber = Fiber.new do
      object.send(method_name, *args) do |*yielded_values|
        Fiber.yield(*yielded_values)
      end
    end
  end

  def next
    @fiber.resume
  end
end

enum = MyEnumerator.new(self, :names)
enum.next                       # => "Ylva"
enum.next                       # => "Brighid"

#class MyEnumerator
#   class StopIteration < RuntimeError
#   end
#
#   def initialize(object, method_name, *args)
#     @fiber = Fiber.new do
#       object.send(method_name, *args) do |*yielded_values|
#         Fiber.yield(*yielded_values)
#       end
#       raise StopIteration
#     end
#   end
#
#   def next
#     @fiber.resume
#   end
# end
#
# enum = MyEnumerator.new(self, :names)
# enum.next                       # => "Ylva"
# enum.next                       # => "Brighid"
# enum.next                       # => "Shifra"
# enum.next                       # => "Yesami
#
comforts of Enumerable. We can convert it to an array; search through it with #detect; and so on.

# class MyEnumerator
#   include Enumerable
#
#   class StopIteration < RuntimeError
#   end
#
#   def initialize(object, method_name, *args)
#     method = object.method(method_name)
#     @fiber = Fiber.new do
#       method.call(*args) do |*yielded_values|
#         Fiber.yield(*yielded_values)
#       end
#       raise StopIteration
#     end
#   end
#
#   def next
#     @fiber.resume
#   end
#
#   def each
#     loop do
#       yield self.next
#     end
#   rescue StopIteration
#     # NOOP
#   end
# end
#
# enum = MyEnumerator.new(self, :names)
# enum.to_a                 # => ["Ylva", "Brighid", "Shifra", "Yesamin"]
# enum = MyEnumerator.new(self, :names)
# enum.detect{|n| n =~ /^S/} # => "Shifra"
# enum = MyEnumerator.new(self, :names)
#
class MyEnumerator
  include Enumerable

  class StopIteration < RuntimeError
  end

  DEFAULT_YIELD_HANDLER = ->(*yielded_values) do
    Fiber.yield(*yielded_values)
  end

  def initialize(object, method_name, *args, &yield_handler)
    method = object.method(method_name)
    yield_handler ||= DEFAULT_YIELD_HANDLER
    @fiber = Fiber.new do
      method.call(*args, &yield_handler)
      raise StopIteration
    end
  end

  def next
    @fiber.resume
  end

  def each
    loop do
      yield self.next
    end
  rescue StopIteration
    # NOOP
  end

  def with_index
    index = 0
    self.class.new(self, :each) do |*yielded_values|
      Fiber.yield(*yielded_values, index)
      index += 1
    end
  end
end

enum = MyEnumerator.new(self, :names)
enum.with_index.each do |name, index|
  puts "#{index}: #{name}"
end
# >> 0: Ylva
# >> 1: Brighid
# >> 2: Shifra
# >> 3: Yesamin