require 'word_counter'

module WordCounter
  describe WebpageParser do
    describe '#parse' do
      let(:webpage_parser) { webpage_parser = WebpageParser.new }

      it 'parses webpages correctly(1)' do
        url = "https://raw.githubusercontent.com/thebravoman/software_engineering_2015/master/hm_count_words/spec/web_tests/test1.txt"
        result = webpage_parser.parse(url).to_csv
        expected = ["a,1","is,1","sentence,1","this,1","\"marks\",3"].join("\n")

        expect(result).to eql expected
      end

      it 'parses webpages correctly(2)' do
        url = "https://raw.githubusercontent.com/thebravoman/software_engineering_2015/master/hm_count_words/spec/web_tests/test2.txt"
        result = webpage_parser.parse(url).to_csv
        expected = ["is,2","name,2","you,2","are,1","bob,1","called,1","hello,1","meet,1","my,1","nice,1","nikolay,1","oh,1","to,1","what,1","your,1","\"marks\",10"].join("\n")


        expect(result).to eql expected
      end

      it 'parses webpages correctly(3)' do
        url = "https://raw.githubusercontent.com/thebravoman/software_engineering_2015/master/hm_count_words/spec/web_tests/test3.txt"
        result = webpage_parser.parse(url).to_csv
        expected = ["ll,2","awepm,1","er,1","gjtptacwume,1","\"marks\",9"].join("\n")

        expect(result).to eql expected
      end
    end
  end
end
