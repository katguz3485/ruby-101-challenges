require_relative '../library/main'

describe Main do
  describe '#score' do
    it "returns 0 for an all gutter game" do
      subject = Main.new
      20.times {subject.roll(0)}
      expect(subject.score).to eq(0)
    end
  end
end
