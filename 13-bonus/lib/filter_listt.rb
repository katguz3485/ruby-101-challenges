def filter_list(l)


  l.select {|w| w.is_a? Numeric}
  # l.delete_if { |x| x.class == String }

end


p filter_list([1, 2, 'a', 'b'])



