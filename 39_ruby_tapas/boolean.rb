true.class                      # => TrueClass
false.class                     # => FalseClass
TrueClass.ancestors             # => [TrueClass, Object, Kernel, BasicObject]
FalseClass.ancestors            # => [FalseClass, Object, Kernel, BasicObject]


def want_fries_with_that?(true_or_false)
  puts "Customer wants fries: #{true_or_false}"
end

want_fries_with_that?(false)

# => nil
# 2.7.1 :156 > (true.methods & false.methods).count # => 59
#  => 63
# 2.7.1 :157 > true.methods.count
#  => 63
# 2.7.1 :158 > false.methods.count
#  => 63
# 2.7.1 :159 > ((true.methods & false.methods) - Object.instance_methods)
# count
#  => 3
# ((true.methods & false.methods) - Object.instance_methods)
#
# true | false                    # => true
# false | false                   # => false
#
# true & true                     # => true
# false & true                    # => false
#
# true ^ true                     # => false
# false ^ true                    # => true
#
responses = [
    true,
    true,
    nil,
    false,
    "I reject the premise!",
    true
]

def process_response(response)
    case response
    when String
      puts "Other: #{response}"
    when nil
      puts "N/A"
    when true, false
      tally_vote(response)
    end
end

@votes = {true => 0, false => 0}
def tally_vote(response)
  @votes[response] += 1
end

responses.each do |response|
  process_response(response)
end
puts @votes.inspect
#N/A
# Other: I reject the premise!
#  => [true, true, nil, false, "I reject the premise!", true]
# 2.7.1 :228 > puts @votes.inspect
# {true=>3, false=>1}
#  => nil