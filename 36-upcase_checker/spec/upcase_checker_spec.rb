require_relative '../lib/upcase_checker'

describe UpcaseChecker do
  subject { described_class.new(word: word).call }

  let(:valid_word) { "Properly formatted word" }
  let(:invalid_word) { "wrong format" }
  let(:integer) { 666 }

  context 'when provided word is a string' do
    context 'when word has proper format' do
      let(:word) { valid_word }

      it 'returns empty hash' do
        expect(subject).to eq({})
      end
    end

    context 'when word does not match proper format' do
      let(:word) { invalid_word }

      it 'returns information message' do
        expect(subject).to eq("Your word: #{word} is not formatted properly")
      end
    end
  end

  context 'when provided word has not suitable format' do
    let(:word) { integer }
    let(:error_message) { 'Please provide proper format of word that you want to check' }

    it 'raises error' do
      expect { subject }.to raise_error(StandardError, error_message)
    end
  end
end

