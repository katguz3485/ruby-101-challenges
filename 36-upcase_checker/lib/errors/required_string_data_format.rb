module Errors
  class RequiredStringDataFormat < StandardError

    def message
      'Please provide proper format of word that you want to check'
    end

    def self.validate_word_format(word)
      raise RequiredStringDataFormat unless word.is_a? String
    end

  end
end
