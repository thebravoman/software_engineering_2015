require 'word_counter'

module WordCounter
  describe FileParser do
    describe '#parse' do
      def create_tmp_file(string)
        tmp_dir = File.expand_path(File.dirname(__FILE__))
        FileUtils::mkdir_p tmp_dir

        file = Tempfile.new('text-file')
        file.write(string)
        file.close

        file
      end

      let(:file_parser) { file_parser = FileParser.new }

      it 'parses files correctly(1)' do
        file = create_tmp_file('This, is. a sentence!')
        expected = ["a,1", "is,1", "sentence,1", "this,1", "\"marks\",3"].join("\n")

        expect(file_parser.parse(file.path).to_csv.strip).to eql expected
      end

      it 'parses files correctly(2)' do
        file = create_tmp_file <<-TEXT
          Hello,
          My name is 'Bob'.
          What is your name?
          Oh, you are called 'Nikolay'?
          Nice to meet you!
        TEXT

        expect(file_parser.parse(file.path).to_csv.strip).to eq(
          ["is,2", "name,2", "you,2", "are,1", "bob,1",
          "called,1", "hello,1", "meet,1", "my,1",
          "nice,1", "nikolay,1", "oh,1", "to,1",
          "what,1", "your,1", "\"marks\",10"].join("\n"))
      end

      it 'parses files correctly(3)' do
        file = create_tmp_file('.//,ll;ll[]er;gjtptacwume,awepm')
        expected = ["ll,2", "awepm,1", "er,1", "gjtptacwume,1", "\"marks\",9"].join("\n")

        expect(file_parser.parse(file.path).to_csv.strip).to eql expected
      end
    end
  end
end
