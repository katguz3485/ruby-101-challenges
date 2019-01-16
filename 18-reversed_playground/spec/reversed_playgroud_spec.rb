require 'spec_helper'
require_all 'lib'

describe ReversedPlayground do

  TEST_WORD = "abcd"
  RESULT = "A-Bb-Ccc-Dddd"

  before(:each) do
    @subject = ReversedPlayground.new
  end

  describe '.enhancer' do
    it 'should convert word to required format' do
      expect(@subject.enhancer(TEST_WORD)).to eq(RESULT)
    end
  end


end
