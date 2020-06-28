r = /\d{3}-\d{4}/
match = r.match("my number is 555-1234")
puts "Found #{match}"

r = /\d{3}-\d{4}/
match = r.match("my number is 555-1234")
if match
  puts "Found #{match}"
end

r = /\d{3}-\d{4}/
if (match = r.match("my number is 555-1234"))
  puts "Found #{match}"
end