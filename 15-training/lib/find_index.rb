class FindIndex

  # method is searching for an element and returns index of array where element is located

  def find_index(array, value)
    puts array.index(value) unless array.include?(value)
  end

  def find_index2(array, value)
    array.each_with_index do |elem, index|
      puts index if elem == value
    end
  end

  finder = FindIndex.new
  finder.find_index([1, 2, 3], 3)
  finder.find_index2([1, 2, 3], 2)
  finder.find_index2([1, 2, 3], 4)


end