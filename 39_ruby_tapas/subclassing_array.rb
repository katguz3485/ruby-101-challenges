# class TagList < Array
#
#   def <<(tag)
#     tag.to_s.strip.split.each do |t|
#       super(t)
#     end
#     self
#   end
#
#   def to_s
#     join(" ")
#   end
#
# end
#
# tags = TagList.new
# tags << "foo" << "bar" << "baz buz"
# puts tags.to_s # => "foo bar baz buz"
# tags.grep(/b/) # => ["bar", "baz", "buz"]
# tags.class

class TagList
  def initialize(*args)
    @list = Array.new(*args)
  end

  def <<(tag)
    tag.to_s.strip.split.each do |tag|
      list <<  t
    end
    self
  end

  def to_s
    list.join(" ")
  end

  def +(other)
    self.class.new(list + other.list + %w[bla bla])
  end

  protected

  attr_reader :list
end

tl1 = TagList.new(%w[carrot potato])
tl2 = TagList.new(%w[sth sth2])
tl1.to_s # => carrot potato
tl2.to_ s # sth sth2]\
tl1 + tl2  # @list=["carrot", "potato", "sth", "sth2", "bla", "bla"]>
