require 'pp'
[0,1,2,3,4,5,6,7,8,9].each_slice(2) do |slice|
  pp slice
end


sums = [0,1,2,3,4,5,6,7,8,9].each_slice(2).map do |slice|
  slice.reduce(:+)
end
sums

def names
  return to_enum(:names) unless block_given?
  yield "Ylva"
  yield "Brighid"
  yield "Shifra"
  yield "Yesamin"
end
# names                           # => #<Enumerator: main:names>
# names.to_a
#
def names
  return to_enum(__callee__) unless block_given?
  yield "Ylva"
  yield "Brighid"
  yield "Shifra"
  yield "Yesamin"
end