require 'pp'
require 'rails'

#present blank empty test

def test
  puts [].empty?
  puts "".empty?
  puts [].present?
  puts 1.present?
  puts nil.blank?
end


def flizz_buzz(value)
  return "FizzBuzz" if value % 3 == 0 && value % 5 == 0
  return "Fizz" if value % 3 == 0
  return "Buzz" if value % 5 == 0
  value

end

pp test

pp flizz_buzz(15)
pp flizz_buzz(3)
pp flizz_buzz(5)
pp flizz_buzz(1)

