class AddEvenNumbers
# calculates the sum of even numbers from 1..n


  def add_even_numbers(n)
    i = 0
    sum = 0
    while i < n
      if n.even?
        sum = sum + i
      end
      i += 1
    end
    puts sum
  end

  def add_even_numbers2(n)
    range = 1..n
    result = range.select {|num| num.even?}
    puts result.sum
  end

  def add_even_numbers3(n)
    range = (1..n)
    result = range.find_all { |num| num.even? }
    puts result.sum
  end


  addEvenNumbers = AddEvenNumbers.new
  addEvenNumbers.add_even_numbers(4)
  addEvenNumbers.add_even_numbers2(4)
  addEvenNumbers.add_even_numbers3(4)


end