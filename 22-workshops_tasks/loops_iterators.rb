people = [{ name: "Bob", occupation: "Builder" }, { name: "Jim", occupation: "Coder" }]

people.each do |person|
  person.each do |_k, v|
    puts v.to_s
  end
end

array_of_hashes = [{ name: "Jakub", age: 28 }]


array_of_hashes.each do |person|
  person.each do |_k, v|
    puts v.to_s
  end
end

array_of_hashes.each do |person|
  puts "#{person[:name]} is #{person[:age]} years old"
end

array_of_hashes.each do |person|
  puts "#{person.dig(:name)} is #{person.dig(:age)} years old"
end



def array_even_power
  array = (1..10).to_a
  array.select(&:even?).map { |x| x**2 }
end

def remove_even_numbers
  array = (1..10).to_a
  array.reject(&even?)
end

def calculate_product_1_to_10
  array = (1..10).to_a
  array.reduce(:+)
end


