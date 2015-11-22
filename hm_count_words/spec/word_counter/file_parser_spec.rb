require 'word_counter'

describe 'FileParser' do
  describe '.parse' do
    it 'exists' do
      expect(WordCounter::FileParser).to respond_to(:parse)
    end

    it 'has parameter \'filename\'' do
      expect(WordCounter::FileParser.method(:parse).parameters).to eql [[:req, :filename]]
    end
  end
end