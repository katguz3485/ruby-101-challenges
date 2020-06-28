Payment  = Struct.new(:payee, :amount, :tags)
Dateline = Struct.new(:date)
TRANSACTIONS = [
    Dateline.new("2015-01-01"),
    Payment.new("Milliways", 25476, "dining travel"),
    Payment.new("Sirius Cybernetics", 7839),
    Payment.new("Old Pink Dog Bar", 2790, "dining"),
    Dateline.new("2015-01-02"),
    Payment.new("Magrathea", 49900000000000000, "real-estate"),
    Payment.new("Big Bang Burger Bar", 4780),
    Payment.new("Megadodo", 7850, "travel"),
]

date = nil
puts TRANSACTIONS.map{|t|
  case t
  when Dateline
    date = t.date
    next
  else
    "%s: %.2f to %s" % [date, t.amount / 100.0, t.payee]
  end
}

## >> 2015-01-01: 254.76 to Milliways
# # >> 2015-01-01: 78.39 to Sirius Cybernetics
# # >> 2015-01-01: 27.90 to Old Pink Dog Bar
# # >>
# # >> 2015-01-02: 499000000000000.00 to Magrathea
# # >> 2015-01-02: 47.80 to Big Bang Burger Bar
# # >> 2015-01-02: 78.50 to Megadodo
#
#
date = nil
puts TRANSACTIONS.map{|t|
  case t
  when Dateline
    date = t.date
    next
  else
    "%s: %.2f to %s" % [date, t.amount / 100.0, t.payee]
  end
}.compact

TRANSACTIONS.grep(Payment).map{|t|
  t.tags.to_s.split
}
# => [["dining", "travel"], [], ["dining"], ["real-estate"], [], ["travel"]]


TRANSACTIONS.grep(Payment).map{|t|
  t.tags.to_s.split
}.flatten
# => ["dining", "travel", "dining", "real-estate", "travel"]


TRANSACTIONS.grep(Payment).map{|t|
  t.tags.to_s.split
}.flatten.uniq
# => ["dining", "travel", "real-estate"]
#

%W[foo bar baz].map(&:chars)
# => [["f", "o", "o"], ["b", "a", "r"], ["b", "a", "z"]]
#
%W[foo bar baz].map{|s| s.chars}
# => [["f", "o", "o"], ["b", "a", "r"], ["b", "a", "z"]]
#
# chars = %W[foo bar baz].lazy.flat_map{|s| s.chars}
#
# chars.first(6)                  # => ["f", "o", "o", "b", "a", "r"]

date = nil
puts TRANSACTIONS.flat_map{|t|
  case t
  when Dateline
    date = t.date
    next []
  else
    "%s: %.2f to %s" % [date, t.amount / 100.0, t.payee]
  end
}
