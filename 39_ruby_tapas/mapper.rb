Episode = Struct.new(
    :id,
    :number,
    :name,
    :description,
    :video_url,
    :publish_time,
    :free) do

  def initialize(attributes={})
    attributes.each do |key, value|
      self[key] = value
    end
  end
end

e = Episode.new(number: 164, name: "Mapper")
e
#2.7.1 :493 > e
#  => #<struct Episode id=nil, number=164, name="Mapper", description=nil, video_url=nil, publish_time=nil, free=nil>
#
class EpisodeMapper
  attr_reader :gateway

  def initialize(gateway)
    @gateway = gateway
  end

  def all
    each_episode.to_a
  end

  def each_episode
    return to_enum(__callee__) unless block_given?
    last_number = 0
    gateway.content_post_list.each do |ep_summary|
      title_parts = /^(\d{3})\W+(.*)/.match(ep_summary[:title])
      if title_parts
        name   = title_parts[2]
        number = title_parts[1].to_i
      else
        name   = ep_summary[:title]
        number = last_number + 1
      end
      last_number = number
      episode = Episode.new(
          id:     ep_summary[:id],
          number: number,
          name:   name,
          publish_time: ep_summary[:publish_time])
      yield(episode)
    end
  end
end

require "~/dev/rubytapas.com/environment"
require "ruby_tapas"
RubyTapas.configure do |config|
  config.log_file = "/dev/null"
end
gw = DPD::ContentPostGateway.new(
    RubyTapas.dpd_admin_session,
    logger: RubyTapas.logger)

require "./episode"
require "./episode_mapper"
mapper = EpisodeMapper.new(gw)
mapper.all.take(10)
# => [#<struct Episode
#      id=18,
#      number=1,
#      name="Binary Literals",
#      description=nil,
#      video_url=nil,
#      publish_time=2012-09-24 09:00:00 -0400,
#      free=nil>,
#     #<struct Episode
#      id=20,
#      number=2,
#      name="Large Integer Literals",
#      description=nil,
#      video_url=nil,
#      publish_time=2012-09-26 09:00:00 -0400,
#      free=nil>,
#     #<struct Episode
#      id=21,
#      number=3,
#      name="Character Literals",
#      description=nil,
#      video_url=nil,
#      publish_time=2012-09-28 09:00:00 -0400,
#      free=nil>,
#     #<struct Episode
#      id=26,
#      number=4,
#      name="Barewords",
#      description=nil,
#      video_url=nil,
#      publish_time=2012-10-01 09:00:00 -0400,
#      free=nil>, # !> loading in progress, circular require considered harmful - /home/avdi/dev/rubytapas.com/bundle/ruby/2.0.0/gems/wistia-api-0.2.3/lib/wistia/config.rb
#     #<struct Episode
#      id=27,
#      number=5,
#      name="Array Literals",
#      description=nil,
#      video_url=nil,
#      publish_time=2012-10-03 09:00:00 -0400,
#      free=nil>, # !> assigned but unused variable - session
#     #<struct Episode
#      id=31,
#      number=6,
#      name="Forwardable",
#      description=nil,
#      video_url=nil,
#      publish_time=2012-10-05 09:00:00 -0400,
#      free=nil>,
#     #<struct Episode
#      id=32,
#      number=7,
#      name="Constructors",
#      description=nil, # !> assigned but unused variable - ex
#      video_url=nil,
#      publish_time=2012-10-08 09:00:00 -0400,
#      free=nil>,
#     #<struct Episode
#      id=38,
#      number=8,
#      name="fetch as an Assertion",
#      description=nil, # !> method redefined; discarding old logger=
#      video_url=nil,
#      publish_time=2012-10-10 09:00:00 -0400,
#      free=nil>,
#     #<struct Episode
#      id=39,
#      number=9,
#      name="Symbol Literals",
#      description=nil,
#      video_url=nil,
#      publish_time=2012-10-12 09:00:00 -0400,
#      free=nil>,
#     #<struct Episode
#      id=43,
#      number=10, # !> private attribute?
#      name="Finding $HOME",
#      description=nil,
#      video_url=nil,
#      publish_time=2012-10-15 09:00:00 -0400,
#      free=nil>]
#
#
# require "~/dev/rubytapas.com/environment"
# require "ruby_tapas"
# RubyTapas.configure do |config|
#   config.log_file = "/dev/null"
# end
# gw = DPD::ContentPostGateway.new(
#   RubyTapas.dpd_admin_session,
#   logger: RubyTapas.logger)
#
# require "./episode"
# require "./episode_mapper"
# mapper = EpisodeMapper.new(gw)
# mapper.each_episode.take(10)
# # => [#<struct Episode
# #      id=18,
# #      number=1,
# #      name="Binary Literals",
# #      description=nil,
# #      video_url=nil,
# #      publish_time=2012-09-24 09:00:00 -0400,
# #      free=nil>,
# #     #<struct Episode
# #      id=20,
# #      number=2,
# #      name="Large Integer Literals",
# #      description=nil,
# #      video_url=nil,
# #      publish_time=2012-09-26 09:00:00 -0400,
# #      free=nil>,
# #     #<struct Episode
# #      id=21,
# #      number=3,
# #      name="Character Literals",
# #      description=nil,
# #      video_url=nil,
# #      publish_time=2012-09-28 09:00:00 -0400,
# #      free=nil>,
# #     #<struct Episode
# #      id=26,
# #      number=4,
# #      name="Barewords",
# #      description=nil,
# #      video_url=nil,
# #      publish_time=2012-10-01 09:00:00 -0400,
# #      free=nil>, # !> loading in progress, circular require considered harmful - /home/avdi/dev/rubytapas.com/bundle/ruby/2.0.0/gems/wistia-api-0.2.3/lib/wistia/config.rb
# #     #<struct Episode
# #      id=27,
# #      number=5,
# #      name="Array Literals",
# #      description=nil,
# #      video_url=nil,
# #      publish_time=2012-10-03 09:00:00 -0400,
# #      free=nil>, # !> assigned but unused variable - session
# #     #<struct Episode
# #      id=31,
# #      number=6,
# #      name="Forwardable",
# #      description=nil,
# #      video_url=nil,
# #      publish_time=2012-10-05 09:00:00 -0400,
# #      free=nil>,
# #     #<struct Episode
# #      id=32,
# #      number=7,
# #      name="Constructors",
# #      description=nil, # !> assigned but unused variable - ex
# #      video_url=nil,
# #      publish_time=2012-10-08 09:00:00 -0400,
# #      free=nil>,
# #     #<struct Episode
# #      id=38,
# #      number=8,
# #      name="fetch as an Assertion",
# #      description=nil, # !> method redefined; discarding old logger=
# #      video_url=nil,
# #      publish_time=2012-10-10 09:00:00 -0400,
# #      free=nil>,
# #     #<struct Episode
# #      id=39,
# #      number=9,
# #      name="Symbol Literals",
# #      description=nil,
# #      video_url=nil,
# #      publish_time=2012-10-12 09:00:00 -0400,
# #      free=nil>,
# #     #<struct Episode
# #      id=43,
# #      number=10, # !> private attribute?
# #      name="Finding $HOME",
# #      description=nil,
# #      video_url=nil,
# #      publish_time=2012-10-15 09:00:00 -0400,
# #      free=nil>]
