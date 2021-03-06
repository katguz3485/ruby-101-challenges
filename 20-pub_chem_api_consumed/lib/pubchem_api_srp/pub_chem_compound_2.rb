require 'open-uri'
require 'json'
require 'rails'
require 'pry-rails'
require_relative './pub_chem_service_cid.rb'

class PubChemCompoundPicture2
  URL = 'https://pubchem.ncbi.nlm.nih.gov/rest/pug/compound/cid/' + @cid.to_s + '/PNG'


  def initialize(cid:)
    @cid = PubChemServiceCid.new(cas: "50-78-2").call
  end

  def call
    picture_download
  end

  private

  def picture_download
    # https://pubchem.ncbi.nlm.nih.gov/rest/pug/compound/cid/2244/PNG

    open(URL).read
  rescue OpenURI::HTTPError => e
    return nil
  end
end

puts pubChem = PubChemCompoundPicture2.new(cid: @cid).call





