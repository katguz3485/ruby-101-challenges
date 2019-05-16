require 'pp'

class PValidator
  def valid_parentheses(string)
    brackets_hash = { "(" => ")" }
    counter = 0
    brackets_hash.each do |k, v|
      counter += string.count(k) + string.count(v)
    end

    brackets = []
    string.each_char do |char|
      brackets << char if brackets_hash.keys.include?(char)
      brackets.pop if brackets_hash.values.include?(char)
    end

    brackets.empty? && counter.even? ? true : false
  end
end


validator = PValidator.new
# pp validator.valid_parentheses("hi(hi)()")
# pp validator.valid_parentheses(")test")
# pp validator.valid_parentheses("")
pp validator.valid_parentheses("((()")
# # pp validator.valid_parentheses("hi())(")
# pp validator.valid_parentheses("hi(hi)()")
# validator.valid_parentheses(" )i(zyzguvpz)s(iizopkc()bpd)(ws)i)nyla")
# validator.valid_parentheses("y()(kr))swp)k")




