require 'moneta'

# store = Moneta.new(:YAML, file: "store.yaml")
# store['question'] = "Life, the universe, and everything"
# store['answer']   = 42
#
# store = Moneta.new(:File, dir: "store")
# store['question'] = "Life, the universe, and everything"
# store['answer']   = 42
#
cache = Moneta.new(:YAML, file: "weather.yaml")
puts Weather.new(cache: cache).report('17361')