require 'pp'


# def hash_method_test(hash)
#   puts hash[:name]
#   puts hash[:hobby]
#   puts hash[:country]
#   puts hash.values
#   puts hash.keys
#   puts hash.key("Poland")
# end


hash = { name: "Kasia", hobby: "traveling", country: "Poland" }

hash_height = { Kasia: 164, Szymon: 182, Kuba: 178 }

def print_names(hash)
  hash.keys
end

def average_height(hash)
  # hash.values.inject(:+) / hash.size
  hash.values.sum / hash.length
end

# pp hash_method_test(hash)
pp print_names(hash_height)
pp average_height(hash_height)