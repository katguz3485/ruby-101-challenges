require 'httparty'
require 'ostruct'
require 'json'

class OStructExample
  include HTTParty

  base_uri 'https://pubchem.ncbi.nlm.nih.gov/rest/pug'

  def initialize(cid)
    @cid = cid
    @characteristics = OpenStruct.new(properties_hash)
  end

  def print_characteristics
    puts "Formula: #{characteristics.formula}"
    puts "MW: #{characteristics.molecular_weight}"
    puts "IUPACName: #{characteristics.name}"
  end

  # def print_characteristics(properties)
  #   puts "Formula: #{properties['MolecularFormula']}"
  #   puts "MW: #{properties['MolecularWeight']}"
  #   puts "IUPACName: #{properties['IUPACName']}"
  # end

  private

  attr_reader :characteristics

  def properties
    response = self.class.get("/compound/cid/#{@cid}/property/IUPACName,MolecularWeight,MolecularFormula,InChIKey,CanonicalSMILES/JSON")
    if response.success?
      property = response["PropertyTable"]["Properties"].join(",")
    else
      raise response.response
    end
    JSON.parse(property.gsub(/:([a-zA-z]+)/, '"\\1"').gsub('=>', ': '))
  end

  def properties_hash
    {
        'formula' => properties['MolecularFormula'],
        'molecular_weight' => properties['MolecularWeight'],
        'name' => properties['IUPACName']
    }
  end
end

o = OStructExample.new(1234)
puts o.print_characteristics
