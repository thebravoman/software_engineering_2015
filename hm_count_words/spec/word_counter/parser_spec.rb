require 'word_counter'

describe 'Parser' do
  describe '.parse' do
    it 'exists' do
      expect(WordCounter::Parser).to respond_to(:parse)
    end

    it 'has parameter \'string\'' do
      expect(WordCounter::Parser.method(:parse).parameters).to eql [[:req, :string]]
    end
  end
end