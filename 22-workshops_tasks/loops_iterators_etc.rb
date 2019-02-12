require 'pp'

pp array = (1..3).to_a
pp  array.map { |x| x ** 2 }
pp array.select {|x| x.odd?}
pp array.select(&:odd?)
pp array.reject(&:odd?)
pp array.reject!(&:odd?)
pp array.select!(&:odd?)

pp array2 = (1..10).to_a
pp array2.select(&:even?)
pp array2.reject(&:even?)
pp array2.inject(:*)


