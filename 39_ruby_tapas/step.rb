99.downto(95) do |n|
  puts "#{n} bottles of beer on the wall, #{n} bottles of beer"
  puts "Take one down, pass it around, #{n-1} bottles of beer on the wall"
end

99.step(to: 95, by: -2) do |n|
  puts "#{n} bottles of beer on the wall, #{n} bottles of beer"
  puts "Take one down, pass it around, #{n-1} bottles of beer on the wall"
end

1.step(to: 5) do |n|
  puts n
end

ids = [3, 2, 5, 4, 1, 7]
id = 1.step do |n|
  break n if !ids.include?(n)
end
puts "Free ID: #{id}"

0.0.step(to: 1.0, by: 0.05) do |n|
  puts n
end

0.step(to: 100, by: 2).reduce(:+)

#.7.1 :091 > 0.0.step(to: 1.0, by: 0.05) do |n|
# 2.7.1 :092 >   puts n
# 2.7.1 :093 > end
# 0.0
# 0.05
# 0.1
# 0.15000000000000002
# 0.2
# 0.25
# 0.30000000000000004
# 0.35000000000000003
# 0.4
# 0.45
# 0.5
# 0.55
# 0.6000000000000001
# 0.65
# 0.7000000000000001
# 0.75
# 0.8
# 0.8500000000000001
# 0.9
# 0.9500000000000001
# 1.0
#  => 0.0