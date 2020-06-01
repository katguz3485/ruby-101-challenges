class UpcaseChecker

  def initialize(word:)
    @word = word
  end

  def call
    print_message unless Errors::RequiredStringDataFormat.validate_word_format(word)
  end

  private

  attr_reader :word

  def print_message
    check_word_first_letter[:upcased?] || {}
  end

  def check_word_first_letter
    return {} if word.chars.first.match?(regexp)
    {word: word, upcased?: "Your word: #{word} is not formatted properly"}
  end

  def regexp
    @regexp ||= Regexp.new(/^[A-Z]/)
  end

end

