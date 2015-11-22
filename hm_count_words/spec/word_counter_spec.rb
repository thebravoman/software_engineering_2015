require_relative 'spec_helper.rb'
require 'word_counter'

describe WordCounter do
  describe '.parse' do
    it 'exists' do
      expect(WordCounter).to respond_to(:parse)
    end

    it 'has parameter \'string\'' do
      expect(WordCounter.method(:parse).parameters).to eql [[:req, :string]]
    end
  end

  describe '.parse_file' do
    it 'exists' do
      expect(WordCounter).to respond_to(:parse_file)
    end

    it 'has parameter \'filename\'' do
      expect(WordCounter.method(:parse_file).parameters).to eql [[:req, :filename]]
    end
  end

  describe '.parse_webpage' do
    it 'exists' do
      expect(WordCounter).to respond_to(:parse_webpage)
    end

    it 'has parameter \'url\'' do
      expect(WordCounter.method(:parse_webpage).parameters).to eql [[:req, :url]]
    end
  end
end
