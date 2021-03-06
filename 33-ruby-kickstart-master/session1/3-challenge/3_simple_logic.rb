# remember, you can test this file with
#   $ rake 1:3


# Given a number, n, return 10 if it is even, and 20 if it is odd
#
# ten_twenty(5) # => 20
# ten_twenty(6) # => 10

def ten_twenty(n)
  return 10 if n.even?
  return 20 if n.odd?
end

# puts ten_twenty(5)
# puts ten_twenty(6)