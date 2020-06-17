require 'faker'

class WordCounter

  def initialize(text:)
    @text = text
  end

  attr_reader :text

  def word_count(word_count = {})
    text.split.map(&:downcase).each do |word|
      word_count[word] ||= 0
      word_count[word] += 1
    end
    word_count
  end
end

wc = WordCounter.new(text: Faker::Movies::StarWars.quote(character: "yoda") * 3)
puts word_count