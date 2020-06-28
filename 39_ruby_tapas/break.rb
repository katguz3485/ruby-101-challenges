i = 0
while true
  puts "Iteration #{i}"
  break if i >= 2
  i += 1
end

def names
  yield "Ylva"
  yield "Brighid"
  yield "Shifra"
  yield "Yesamin"
end

names do |name|
  puts name
  break if name =~ /^S/
end

def names
  yield "Ylva"
  yield "Brighid"
  yield "Shifra"
  yield "Yesamin"
ensure
  puts "Grimm"
end

names do |name|
  puts name
end

names do |name|
  puts name
  break if name =~ /^S/
end