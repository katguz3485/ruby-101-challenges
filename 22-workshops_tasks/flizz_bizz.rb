def fizzbuzz_check(value)
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

def foo(val)
  return "FizzBuzz" if val % 15 == 0
  return "Buzz" if val % 5 == 0
  return "Fizz" if val % 3 == 0
end




