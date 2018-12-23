require 'spec_helper'
require_all 'lib'

describe Pesel do

  before(:each) do
    @valid_pesel = 90011297917
    @valid_pesel2 = 90011297927
    @invalid_pesel = 920605121812
    @subject = Pesel.new
  end

  describe 'pesel_to_array' do
    it 'should convert pesel input to array' do
      expect(@subject.pesel_to_array(@valid_pesel)).to eq(@valid_pesel.digits.reverse)
    end
  end

  describe '.pesel_valid?' do
    it 'should check if provided pesel number is valid?' do
      expect(@subject.pesel_valid?(@valid_pesel)).to eq("Pesel number is correct")
      expect(@subject.pesel_valid?(@invalid_pesel)).to eq("Pesel number is not correct")
    end
  end


  describe '.date_of_birth' do
    it 'should print date of birth based on provided pesel number' do
      expect(@subject.date_of_birth(@valid_pesel)).to eq("12-1-1990")
  end
end

  describe '.what_sex' do
    it 'should print if sex is female or male according to the second to last value in pesel' do
      expect(@subject.what_sex(@valid_pesel)).to eq("male")
      expect(@subject.what_sex(@valid_pesel2)).to eq("female")
    end
  end
end
