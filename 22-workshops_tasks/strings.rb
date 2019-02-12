require 'pp'


# checks if word is palindrome?
def is_palindrome?(string)
  string == string.reverse

end

puts is_palindrome?("level")

# takes the first 6 letters from word
#

def word_range(word, n)
  word[0..n]
end

puts word_range("helloworld", 5)

def remove_whitespace(string)
  string.strip
end

puts remove_whitespace("Hello Sth!\n")


def hello_name(name)
  "Hello #{name}"
end

pp hello_name("Kasia")
