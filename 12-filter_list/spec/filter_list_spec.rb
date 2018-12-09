require_relative '../lib/filter_listt'

describe '#filter_list' do


  it 'filter' do
    expect(filter_list([1, 2, 'a', 'b'])).to eq([1, 2])
    expect(filter_list([1, 2, 'aasf', '1', '123', 123])).to eq([1, 2, 123])


  end


end

