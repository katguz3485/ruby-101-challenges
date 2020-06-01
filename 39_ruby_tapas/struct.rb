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
    name: "Red saperavi",
    abv: 12,
    class: 'semi dry'
)

puts wine.attributes
puts wine
