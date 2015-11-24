require_relative 'spec_helper.rb'
require 'word_counter'

describe WordCounter do
  describe '::parse' do
    it 'exists' do
      expect(WordCounter).to respond_to(:parse)
    end

    it 'has parameter \'string\'' do
      expect(WordCounter.method(:parse).parameters).to eql [[:req, :string]]
    end
  end

  describe '::parse_file' do
    it 'exists' do
      expect(WordCounter).to respond_to(:parse_file)
    end

    it 'has parameter \'filename\'' do
      expect(WordCounter.method(:parse_file).parameters).to eql [[:req, :filename]]
    end
  end

  describe '::parse_webpage' do
    it 'exists' do
      expect(WordCounter).to respond_to(:parse_webpage)
    end

    it 'has parameter \'url\'' do
      expect(WordCounter.method(:parse_webpage).parameters).to eql [[:req, :url]]
    end
  end

  describe 'parses files correctly' do
    it do
      file_dir = File.join(File.expand_path(File.dirname(__FILE__)), 'tests/test1.txt')
      expected = ["a,1", "is,1", "sentence,1", "this,1", "\"marks\",3"]
      expect(WordCounter.parse_file(file_dir).to_csv).to eql expected
    end

    it do
      file_dir = File.join(File.expand_path(File.dirname(__FILE__)), 'tests/test2.txt')
      expected = ["is,2", "name,2", "you,2", "are,1", "bob,1", "called,1", "hello,1", "meet,1", "my,1", "nice,1", "nikolay,1", "oh,1", "to,1", "what,1", "your,1", "\"marks\",10"]
      expect(WordCounter.parse_file(file_dir).to_csv).to eql expected
    end

    it do
      file_dir = File.join(File.expand_path(File.dirname(__FILE__)), 'tests/test3.txt')
      expected = ["ll,2", "awepm,1", "er,1", "gjtptacwume,1", "\"marks\",9"]
      expect(WordCounter.parse_file(file_dir).to_csv).to eql expected
    end
  end
end
