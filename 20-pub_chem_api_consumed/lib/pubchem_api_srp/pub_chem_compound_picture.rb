require 'open-uri'
require 'json'
require 'rails'
require 'pry-rails'

require_relative './pub_chem_service_cid.rb'

class PubChemCompoundPicture


  base_uri 'https://pubchem.ncbi.nlm.nih.gov/rest/pug'

  def initialize(cid:)
    @cid = PubChemServiceCid.new(cas: "50-78-2").call
  end

  def call
    picture_download
  end

  private

  def picture_download
    # https://pubchem.ncbi.nlm.nih.gov/rest/pug/compound/cid/2244/PNG
    response = self.class.get("/compound/cid/#{@cid}/PNG")

    if response.success?
      picture = response
    else
      raise response.response
    end
    picture
  end
end

puts pubChem = PubChemCompoundPicture.new(cid: @cid).call





