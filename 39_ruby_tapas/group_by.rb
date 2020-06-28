range = (0..12)                 # => 0..12
range.class                     # => Range

range.group_by{|n| n.even? ? "even" : "odd"}
# => {"even"=>[0, 2, 4, 6, 8, 10, 12], "odd"=>[1, 3, 5, 7, 9, 11]}