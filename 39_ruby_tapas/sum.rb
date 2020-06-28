require "active_support/core_ext/enumerable"
data = [1,2,3,4,5,6,7,8,9,10]
data.sum

data.inject(:+)

data = [1,2,3,4,5,6,7,8,9,10]
sum = data.reduce(0) {|acc, n|
  acc + n
}
sum

data = [1,2,3,4,5,6,7,8,9,10]
sum = data.reduce(0) {|acc, n|
  p [acc, n]
  acc + n
}
sum
#2.7.1 :467 > }
# [0, 1]
# [1, 2]
# [3, 3]
# [6, 4]
# [10, 5]
# [15, 6]
# [21, 7]
# [28, 8]
# [36, 9]
# [45, 10]
# 2.7.1 :468 > sum
#  => 55
#
2 + 2
2.+(2)
2.public_send(:+, 2)

add = :+.to_proc
add.call(2, 2)


add = :+.to_proc               # => #<Proc:0x00000001be0860>
add.call(2, 2)                 # => 4
myadd = ->(a,b) { a.public_send(:+, b) }
myadd.call(2,2)


data = [1,2,3,4,5,6,7,8,9,10]
sum = data.reduce(0, &:+)
sum

data = [1,2,3,4,5,6,7,8,9,10]
sum = data.reduce(0, :+)
sum

data = [1,2,3,4,5,6,7,8,9,10]
sum = data.reduce(:+)
sum

data = [1,2,3,4,5,6,7,8,9,10]
checksum = data.reduce(:^)
#2.7.1 :473 > data = [1,2,3,4,5,6,7,8,9,10]
# 2.7.1 :474 > checksum = data.reduce(:^)
# 2.7.1 :475 > _
#  => 11