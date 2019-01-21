require 'spec_helper'
require_all 'lib'

describe Api do

  test_density = 12.0
  result_density = "12.0 g/mL"

  test_mw = 134.5
  result_mw = "134.5 g/mol"

  resource = '134.5'
  unit = 'kg/L'
  resource_concat_unit = '134.5 kg/L'

  before(:each) do
    @chemical = Api.new
  end

  describe '.unit_of_measurement_adder' do
    it 'should convert word to required format' do
      expect(@chemical.unit_of_measurement_adder(resource, unit)).to eq(resource_concat_unit)
    end
  end

  describe '.molecular_weight_formatter' do
    it 'should convert word to required format' do
      expect(@chemical.molecular_weight_formatter(test_mw)).to eq(result_mw)
    end
  end


  describe '.density_formatter' do
    it 'should convert word to required format' do
      expect(@chemical.density_formatter(test_density)).to eq(result_density)
    end
  end


end
