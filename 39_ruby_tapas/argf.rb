KEYS   = ('a'..'z').to_a
VALUES = KEYS.rotate(13)
CYPHER = Hash[KEYS.zip(VALUES)]


def sekrit(text)
  text.downcase.chars.map{ |char|
    CYPHER[char] || char
  }.join
end

#

ARGF.each_line do |line|
  print sekrit(line)
end

#ARGF.lines do |line|
#   print "#{ARGF.path}: #{sekrit(line)}"
# end

#ruby sekrit.rb < my_secret_stuff.txt