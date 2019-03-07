class TheSameWithRegex


  def valid_parentheses(string)

    a = string.gsub(/[^\(\)]/, '')
    while a.gsub!('()', '');
    end
    a.empty?

  end



end

validator = TheSameWithRegex.new
pp validator.valid_parentheses("dasads((()sasd")