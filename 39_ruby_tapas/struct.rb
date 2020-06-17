Wine = Struct.new(:winery, :name, :abv, :class) do
  def self.from_hash(attributes)
    instance = self.new
    attributes.each do |key, value|
      instance[key] = value
    end
    instance
  end

  def attributes
    result = {}
    members.each do |name|
      result[name] = self[name]
    end
    result
  end
end

wine = Wine.from_hash(
    winery: "Khareba",
    name: "Saperavi",
    abv: 12,
    class: 'semi dry'
)

puts wine.attributes
puts wine


class Point

  attr_accessor :x, :y

  def initialize
    @x = x
    @y = y
  end
end

Point = Struct.new(:x, :y) do
  def to_s
    "(#{x}x#{y})"
  end
end

p= Point.new(1, 2).to_s
# puts p
# puts p.class
# puts p.x = 7
# puts p[:x] = 8
# puts p.y

