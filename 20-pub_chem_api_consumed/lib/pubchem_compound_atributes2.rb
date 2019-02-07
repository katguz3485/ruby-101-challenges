dir = File.expand_path(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'pp'
require 'httparty'
require 'json'
require 'rails'
require 'uri'
require 'pry-rails'

class PubChemApi
  include HTTParty

  base_uri 'https://pubchem.ncbi.nlm.nih.gov/rest/pug'

  # https://pubchem.ncbi.nlm.nih.gov/rest/pug/compound/name/50-78-2/cids/JSON
  # https://pubchem.ncbi.nlm.nih.gov/rest/pug/compound/cid/2244/property/MolecularFormula,InChIKey/JSON
  # https://pubchem.ncbi.nlm.nih.gov/rest/pug/compound/cid/2244/PNG
  # https://pubchem.ncbi.nlm.nih.gov/rest/pug/compound/cid/2244/property/MolecularWeight,MolecularFormula,InChIKey,CanonicalSMILES/JSON

  attr_reader :property

  def initialize
    @property = property
  end

  def cas_to_cid(cas)
    response = self.class.get("/compound/name/#{cas}/cids/JSON")
    if response.success?
      result = response["IdentifierList"]["CID"]
    else
      raise response.response
    end
    cid = result.join("")
  end

  def find_properties(cid)
    response = self.class.get("/compound/cid/#{cid}/property/IUPACName,MolecularWeight,MolecularFormula,InChIKey,CanonicalSMILES/JSON")
    if response.success?
      response["PropertyTable"]["Properties"].instance_of?(String)
      binding.pry
    else
      raise response.response
    end
    @property = response["PropertyTable"]["Properties"]
  end

  def to_hash_object
    property = @property.join(",")
    property = JSON.parse(property.gsub(/:([a-zA-z]+)/, '"\\1"').gsub('=>', ': ')).stringify_keys
    property
  end

  def show_property(name)
    property = to_hash_object
    property[name]
  end

  def picture(cid)
    # https://pubchem.ncbi.nlm.nih.gov/rest/pug/compound/cid/2244/PNG
    response = self.class.get("/compound/cid/#{cid}/PNG")
    if response.success?
      response
      binding.pry
    else
      raise response.response
    end
    response
  end
end


pubChem = PubChemApi.new
puts cid = pubChem.cas_to_cid("50-78-2")
pubChem.find_properties(cid)
puts pubChem.to_hash_object
puts pubChem.show_property("MolecularWeight")
puts pubChem.picture(cid)



