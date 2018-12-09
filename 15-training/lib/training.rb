puts "Ruby Version: " + RUBY_VERSION
puts "Ruby Patch Level: " + RUBY_PATCHLEVEL.to_s

def copyString(n, string)
  string * n

end

puts copyString(1, 'a'), "\n"