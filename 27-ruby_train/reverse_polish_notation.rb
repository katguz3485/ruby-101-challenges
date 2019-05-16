require 'pry'

# For example expression 5 1 2 + 4 * + 3 - (which is equivalent to 5 + ((1 + 2) * 4) - 3 in normal notation) should evaluate to 14.
#
# For your convenience, the input is formatted such that a space is provided between every token.
#
# Empty expression should evaluate to 0.
#
# Valid operations are +, -, *, /.
#
# You may assume that there won't be exceptional situations (like stack underflow or division by zero).


class ReversePolishCalc
  OPERATORS = %w[+ - * /]

  def calc(expr)
    return 0 if expr == ""

    arr = expr.split
    stack = []

    arr.each do |elem|
      if OPERATORS.include?(elem)
        stack << stack.pop(2).reduce(elem)
      else
        stack << elem.to_f
        stack.last
      end
    end
    stack.last
  end
end


rp = ReversePolishCalc.new
puts rp.calc("1 3 -")
puts rp.calc("4 2 /")
puts rp.calc("1 3 *")

