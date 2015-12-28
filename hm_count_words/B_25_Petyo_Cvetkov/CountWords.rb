require './B_25_Petyo_Cvetkov/count_words/write'
require './B_25_Petyo_Cvetkov/count_words/wb_parse'
require './B_25_Petyo_Cvetkov/count_words/Count_words'
require './B_25_Petyo_Cvetkov/count_words/make_graph'
module WordCounter
  def self.parse(text)
      Parser.new.parse(text)
    end

    def self.parse_file(filepath)
      Parser.new.parse_file(filepath)
    end

    def self.parse_webpage(url)
      WebpageParser.new.parse(url)
    end
    def self.parse_dir(dir)
      Parser.new.dir_parser(dir)
    end

end
