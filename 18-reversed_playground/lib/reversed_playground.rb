class ReversedPlayground

  def enhancer(word)
    arr = word.split(//)
    result = arr.map.with_index {|w, index| w * (index + 1)}
    result.map {|m| m.capitalize}.join("-")
  end
end


subject = ReversedPlayground.new
puts subject.enhancer("abcd")
puts subject.enhancer("abcd")

