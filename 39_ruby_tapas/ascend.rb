require 'pathname'
p = Pathname.new("/usr/local/bin")
p.ascend do |path|
  puts path
end

p = Pathname.new("/usr/local/bin")
ascender = p.to_enum(:ascend)
ascender.to_a

ascender = p.to_enum(:ascend)
ascender.detect{|path| (path + 'my_fille.rb').exist?}