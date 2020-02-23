# frozen_string_literal: true

require_relative '../../lib/errors/required_string_data_format'

describe Errors::RequiredStringDataFormat do
  subject { described_class }

  let(:wrong_data_format) { 112 }
  let(:error_message) { 'Please provide proper format of word that you want to check' }

  context 'when word has wrong format' do
    it 'raises RequiredStringDataFormatError' do
      expect { subject.validate_word_format(wrong_data_format) }.to raise_error(StandardError, error_message)
    end
  end

end