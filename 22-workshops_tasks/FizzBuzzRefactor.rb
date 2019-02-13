class FizBuzzRefactored

  attr_accessor :value

  def initialize(value)
    @value = value
  end

  def calculate
    if fizzbuzz?
      "FizzBuzz"
    elsif fizz?
      'Buzz'
    elsif buzz?
      'Fizz'
    else
      value
    end
  end

  def fizzbuzz?
    fizz? && buzz?

  end

  def fizz?
    value % 3 == 0

  end


  def buzz?
    value % 5 == 0

  end


end

fizzbuzz = FizBuzzRefactored.new(3)
puts fizzbuzz.calculate
puts fizzbuzz.value
fizzbuzz.value = 10
puts fizzbuzz.value
puts fizzbuzz.calculate

