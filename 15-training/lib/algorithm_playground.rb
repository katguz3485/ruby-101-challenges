class AlgorithmPlayground

  def enhancer(word)
    array = word.downcase.split(//)
    index = array.size
    output = []

    while index >= array.size
      array.each do |elem|
        temp = (elem * index).capitalize!
        output.push(temp)
        index -= 1
      end
    end
    print output.join("-")
  end


  algorithmPlaygrouound = AlgorithmPlayground.new
  #algorithmPlaygrouound.enhancer('abcdab')
   algorithmPlaygrouound.enhancer('abcdab')

end

