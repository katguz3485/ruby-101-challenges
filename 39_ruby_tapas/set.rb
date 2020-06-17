require "set"
class Friend
  def self.all
    @all ||= {}
  end

  def self.import(contacts)
    contacts.each do |contact|
      friend = all[contact[:name]] ||= new(contact[:name])
      friend.handles[contact[:service]] = contact[:handle]
      friend.tags.merge(contact[:tags])
    end
  end

  attr_accessor :name, :handles, :tags

  def initialize(name)
    @name    = name
    @handles = {}
    @tags    = Set.new
  end

  def add_tags(*tags)
    self.tags |= tags
  end

  def merge_with(other)
    self.handles.merge!(other.handles)
    self.tags.merge(tags)
  end
end

Friend.import([
                  {name: "Avdi Grimm", service: "Twitter", handle: "@avdi", tags: ["tech", "flowers"]},
                  {name: "Avdi Grimm", service: "Instagram", handle: "avdi.grimm", tags: ["flowers", "poetry"]}
              ])

avdi = Friend.all["Avdi Grimm"]
puts avdi
# => #"@avdi", "Instagram"=>"avdi.grimm"},
#     @name="Avdi Grimm",
#     @tags=#>

avdi.add_tags("tech", "cat pics")
puts avdi.tags

# other = Friend.new("Avdi")
# other.handles["Twitch"] = "avdicodes"
# other.tags = ["tech", "livecoding"]
#
# avdi.merge_with(other)
# avdi.handles
# # => {"Twitter"=>"@avdi", "Instagram"=>"avdi.grimm", "Twitch"=>"avdicodes"}
# avdi.tags
# # => #