require_relative '../lib/crush_game'

describe '#crush_game' do

  it 'returns the string after removing 3 or more reapeted chars' do
    expect(crush_game("AABBCCCCBDDDADB")).to eq("DB")
  end


end

