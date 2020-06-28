# true ^ true ^ false ^ false ^ true    # => true

# false if there are no truthy elements in a collection
# pry(main)> [false, nil, nil].one?
# => false

#eturns false if more than one member is truth
# [4] pry(main)> [42, nil, 'banana'].one?
# => false

# exactly one element is truthy, it returns true
# [5] pry(main)> [42, nil, false].one?
# => true

# [].one?                         # => false
#
# [42, 85, 34, 6, 10].one?{|e| e.odd?} # => true
#
#[42, 85, 34, 6, 10].one?(&:odd?) # => true