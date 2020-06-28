def average(collection)
  if collection.length.zero?
    nil
  else
    collection.inject(0.0, :+) / collection.length
  end
end

require "./average"

average([2, 4, 6, 8]) # => 5.0


["apple", "banana", "strawberry"].any?{|n| n.length == 3}

def average(collection)
  if collection.any?
    collection.inject(0.0, :+) / collection.length
  else
    nil
  end
end