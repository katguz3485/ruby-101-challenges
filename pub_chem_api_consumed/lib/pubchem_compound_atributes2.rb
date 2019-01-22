dir = File.expand_path(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'pp'
require 'httparty'

class PubchemCompoundAtributes
  include HTTParty

  base_uri 'https://pubchem.ncbi.nlm.nih.gov/rest/pug'

  #https://pubchem.ncbi.nlm.nih.gov/rest/pug/compound/name/50-78-2/cids/JSON
  # https://pubchem.ncbi.nlm.nih.gov/rest/pug/compound/cid/2244/property/MolecularFormula,InChIKey/JSON
  # https://pubchem.ncbi.nlm.nih.gov/rest/pug/compound/cid/2244/PNG
  # https://pubchem.ncbi.nlm.nih.gov/rest/pug/compound/cid/2244/property/MolecularWeight,MolecularFormula,InChIKey,CanonicalSMILES/JSON

  attr_reader :cid, :cas, :molecular_formula, :inchi_key, :canonical_smiles, :iupac_name

  def initialize()
=begin
    @cas = cas
    @cid = cid
    @iupac_name = iupac_name
    @molecular_formula = molecular_formula
    @inchi_key = inchi_key
    @canonical_smiles = canonical_smiles
=end
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
      response["PropertyTable"]["Properties"]
    else
      raise response.response
    end
  end

  def picture(cid)
    # https://pubchem.ncbi.nlm.nih.gov/rest/pug/compound/cid/2244/PNG
    response = self.class.get("/compound/cid/#{cid}/PNG")
    if response.success?
      return Base64.encode64(response)
    else
      raise response.response
    end
  end


end


pubChem = PubchemCompoundAtributes.new
puts cid = pubChem.cas_to_cid("50-78-2")
puts pubChem.find_properties(cid)
puts pubChem.picture(cid)


