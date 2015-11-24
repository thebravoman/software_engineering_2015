require 'word_counter'

describe 'FileParser' do
  describe '#parse' do
    it 'exists' do
      expect(WordCounter::FileParser.new).to respond_to(:parse)
    end

    it 'has parameter \'filename\'' do
      expect(WordCounter::FileParser.new.method(:parse).parameters).to eql [[:req, :filename]]
    end

    it 'inherits \'Parser\'' do
      expect(WordCounter::FileParser.superclass).to eql WordCounter::Parser
    end
  end
end