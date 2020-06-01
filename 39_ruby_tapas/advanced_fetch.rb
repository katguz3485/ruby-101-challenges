a = [:x, :y, :z]
a.fetch(2)
# a.fetch(3)
#
port = ENV.fetch('PORT'){ 8080 }.to_i

config1 = {
    database: {
        type: 'mysql',
        host: 'localhost'
    }
}

config2 = {}

config2.fetch(:database){{}}.fetch(:type){'sqlite'}
config1.fetch(:database){{}}.fetch(:type){'sqlite'}

{}.fetch(:foo) do |key|
  puts "Missing key #{key}"
end

default = ->(key) do
  puts "#{key} not found please enter it"
  gets
end

h = {}
name = h.fetch(:name, &default)
email = h.fetch(:email, &default)

# n pass a second argument instead.
{}.fetch(:threads, 4)

def default
  42 # the ultimate answer
end

answers = {}
answers.fetch("How many roads must a man walk down?", default)
# => 42