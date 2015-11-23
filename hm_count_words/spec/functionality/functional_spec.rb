require 'word_counter'

describe WordCounter do
  describe 'parses files correctly' do
    it do
      file_dir = '/home/niki/Documents/software_engineering_2015/hm_count_words/spec/functionality/test1.txt'
      expected = ["a,1", "is,1", "sentence,1", "this,1", "\"marks\",3"]
      expect(WordCounter.parse_file(file_dir).to_csv).to eql expected
    end

    it do
      file_dir = '/home/niki/Documents/software_engineering_2015/hm_count_words/spec/functionality/test2.txt'
      expected = ["is,2", "name,2", "you,2", "are,1", "bob,1", "called,1", "hello,1", "meet,1", "my,1", "nice,1", "nikolay,1", "oh,1", "to,1", "what,1", "your,1", "\"marks\",10"]
      expect(WordCounter.parse_file(file_dir).to_csv).to eql expected
    end

    it do
      file_dir = '/home/niki/Documents/software_engineering_2015/hm_count_words/spec/functionality/test3.txt'
      expected = ["ll,2", "awepm,1", "er,1", "gjtptacwume,1", "\"marks\",9"]
      expect(WordCounter.parse_file(file_dir).to_csv).to eql expected
    end
  end
end