class FizBuzz

  attr_accessor :value

  def initialize(value)
    @value = value
  end

  def calculate
    if value % 3 == 0 && value % 5 == 0
      "FizzBuzz"
    elsif value % 5 == 0
      'Buzz'
    elsif value % 3 == 0
      'Fizz'
    else
      value
    end
  end

end


fizzbuzz = FizBuzz.new(3)
puts fizzbuzz.calculate
puts fizzbuzz.value
fizzbuzz.value = 10
puts fizzbuzz.value
puts fizzbuzz.calculate


