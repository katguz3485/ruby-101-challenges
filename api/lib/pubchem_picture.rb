dir = File.expand_path(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'pp'
require 'httparty'


class PubchemPicture
  include HTTParty

  attr_reader :cid

  base_uri 'https://pubchem.ncbi.nlm.nih.gov/rest/pug/'

  def initialize(cid)
    @cid = cid

  end

  def picture
    self.class.get("/compound/cid/#{cid}/PNG")
  end

end

pubChemPicture = PubchemPicture.new(1122)
pp pubChemPicture.picture

