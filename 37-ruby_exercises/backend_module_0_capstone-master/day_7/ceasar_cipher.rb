require 'pry'

class CeasarCipher

  def initialize(shift)
    @shift = shift
    @alphabet = ('A'..'Z').to_a.join
    @indexes = alphabet.chars.map.with_index.to_h
  end

  attr_reader :shift, :alphabet, :indexes

  def encode(text_input)
    #text_input.chars.map { |c| alphabet[(@indexes[c] + @shift) % @alphabet.size] }.join
  end

  def decrypt(text_input)
    #text_input.chars.map { |c| alphabet[(indexes[c] - shift) % alphabet.size] }.join
  end

end


cipher = CeasarCipher.new(5)
cipher.encode("Hello World")


