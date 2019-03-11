dir = File.expand_path(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'pp'
require 'httparty'
require 'json'
require 'rails'
require 'uri'
require 'pry-rails'
require_relative './pub_chem_service_cid.rb'

class PubChemCompoundProperty
  include HTTParty

  # https://pubchem.ncbi.nlm.nih.gov/rest/pug/compound/name/50-78-2/cids/JSON
  # https://pubchem.ncbi.nlm.nih.gov/rest/pug/compound/cid/2244/property/MolecularFormula,InChIKey/JSON
  # https://pubchem.ncbi.nlm.nih.gov/rest/pug/compound/cid/2244/PNG
  # https://pubchem.ncbi.nlm.nih.gov/rest/pug/compound/cid/2244/property/MolecularWeight,MolecularFormula,InChIKey,CanonicalSMILES/JSON

  base_uri 'https://pubchem.ncbi.nlm.nih.gov/rest/pug'

  attr_accessor :table, :cid

  def initialize(cid:)
    @cid = PubChemServiceCid.new(cas: "50-78-2").call
    @table = table
  end


  def call
    find_properties
  end

  private

  def find_properties
    response = self.class.get("/compound/cid/#{@cid}/property/IUPACName,MolecularWeight,MolecularFormula,InChIKey,CanonicalSMILES/JSON")
    if response.success?
      property = response["PropertyTable"]["Properties"].join(",")
    else
      raise response.response
    end
    @table = JSON.parse(property.gsub(/:([a-zA-z]+)/, '"\\1"').gsub('=>', ': ')).symbolize_keys
  end



end


puts pubChemHash = PubChemCompoundProperty.new(cid: @cid).call
puts pubChemHash.values








# pubChem.find_properties(cid)
# puts pubChem.to_hash_object
# puts pubChem.show_property("MolecularWeight")
# puts pubChem.picture(cid)



