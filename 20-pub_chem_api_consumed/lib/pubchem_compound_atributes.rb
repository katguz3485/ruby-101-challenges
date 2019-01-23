dir = File.expand_path(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'pp'
require 'httparty'

class PubChemApi
  include HTTParty

  base_uri 'https://pubchem.ncbi.nlm.nih.gov/rest/pug'

  # https://pubchem.ncbi.nlm.nih.gov/rest/pug/compound/name/50-78-2/cids/JSON
  # https://pubchem.ncbi.nlm.nih.gov/rest/pug/compound/cid/2244/property/MolecularFormula,InChIKey/JSON
  # https://pubchem.ncbi.nlm.nih.gov/rest/pug/compound/cid/2244/PNG
  # https://pubchem.ncbi.nlm.nih.gov/rest/pug/compound/cid/2244/property/MolecularWeight,MolecularFormula,InChIKey,CanonicalSMILES/JSON


  attr_reader :cid, :cas, :molecular_formula, :inchi_key, :canonical_smiles

  def initialize(cas, cid, molecular_formula, inchi_key, canonical_smiles)
    self.cas = cas
    self.cid = cid
    self.iupac_name = iupac_name
    self.molecular_formula = molecular_formula
    self.inchi_key = inchi_key
    self.canonical_smiles = canonical_smiles
  end

  def self.cas_to_cid(cas = "50-78-2")
    response = get("/compound/name/#{cas}/cids/JSON")
    if response.success?
      response["IdentifierList"]["CID"]
    else
      raise response.response
    end
  end

  def self.find(cid = 1234)
    response = get("/compound/cid/#{cid}/property/IUPACName,MolecularWeight,MolecularFormula,InChIKey,CanonicalSMILES/JSON")
    if response.success?
      response["PropertyTable"]["Properties"]
    else
      raise response.response
    end
  end

  def self.picture(cid = 1234)
    # https://pubchem.ncbi.nlm.nih.gov/rest/pug/compound/cid/2244/PNG
    response = get("/compound/cid/#{cid}/PNG")
    if response.success?
      return Base64.encode64(response)
      #puts response
    else
      raise response.response
    end

  end

end

pp pubChemcmompundAttributes = PubChemApi.cas_to_cid
pp pubChemcmompundAttributes = PubChemApi.find
pp pubChemcmompundAttributes = PubChemApi.picture

