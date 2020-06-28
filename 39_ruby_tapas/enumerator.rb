@names = %w[Ylva Brighid Shifra Yesamin]

def names
  yield @names.shift
  yield @names.shift
  yield @names.shift
  yield @names.shift
end

names do |name|
  puts name
end

enum = to_enum(:names)
enum.next


@names = %w[Kashti Aodhan Edgar Heinlein]
enum.rewind
enum.next


enum.with_index do |name, index|
  puts "#{index}: #{name}"
end

Enumerator.ancestors
enum.each do |name|
  puts name
end
enum.to_a
enum.detect{|n| n =~ /^B/}
