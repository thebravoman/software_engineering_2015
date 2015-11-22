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

  describe 'WebpageParser' do
    describe '.parse' do
      it 'exists' do
        expect(WordCounter::WebpageParser).to respond_to(:parse)
      end

      it 'has parameter \'url\'' do
        expect(WordCounter::WebpageParser.method(:parse).parameters).to eql [[:req, :url]]
      end
    end
  end

  describe 'Result' do
    res = WordCounter::Result.new
    it { expect(res).to respond_to(:marks_count) }
    it { expect(res).to respond_to(:word_counts) }
    it { expect(res).to respond_to(:to_csv) }
    it { expect(res).to respond_to(:to_json) }
    it { expect(res).to respond_to(:to_xml) }    
  end
end
