require 'httparty'
require 'pry'
class GitHubService
  include HTTParty

  base_uri 'https://api.github.com/'

  def initialize(user)
    @user = user
  end

  def call
    download_repos(@user)
  end

  private

  def download_repos(user)
    self.class.get("/users/#{user}/repos")
  end

end

gh = GitHubService.new("katguz3485")
puts gh.call.class