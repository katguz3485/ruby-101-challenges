require 'pp'
require 'httparty'
require 'json'
require 'rails'
require 'uri'
require 'pry-rails'

class PubChemServiceCid
  include HTTParty

  base_uri 'https://pubchem.ncbi.nlm.nih.gov/rest/pug'

  attr_accessor :property, :cas

  def initialize(cas:)
    @property = property
    @cas = cas
  end

  def call
    cas_to_cid
  end

  private

  def cas_to_cid
    response = self.class.get("/compound/name/#{cas}/cids/JSON")
    if response.success?
      result = response["IdentifierList"]["CID"]
    else
      raise response.response
    end
    cid = result.join("")
  end
end

puts pubChem = PubChemServiceCid.new(cas: "50-78-2").call

# puts pubChem.to_hash_object
# puts pubChem.show_property("MolecularWeight")
# puts pubChem.picture(cid)


