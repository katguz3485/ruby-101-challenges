require 'httparty'
require 'openssl'
class ApiPlaying
  include HTTParty

  base_uri 'http://localhost:3000'

  def call
    download_warriors(1)
  end

  private

  def download_warriors(clan_no)
    self.class.get("/clans/#{clan_no}/warriors")
  end
end

api_playing = ApiPlaying.new
api_playing.call