require 'pp'

class ValidCas

  def validate(cas_number)
    return false unless cas_number && cas_number.match(/[0-9]{2,7}-[0-9]{2}-[0-9]/)
    check_digit = cas_number[-1, 1].to_i
    sum = 0
    cas_number.reverse.scan(/[0-9]/).each_with_index do |digit, i|
      sum = sum + digit.to_i * i
    end
    check_digit == sum.remainder(10)
  end

  def is_valid?(cas_number)
    validate(cas_number) ? "valid" : "invalid"
  end
end


cas_validator = ValidCas.new
pp cas_validator.validate("71-43-2")
pp cas_validator.is_valid?("71-43-2")