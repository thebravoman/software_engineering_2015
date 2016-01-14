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

    def self.cached
      db = Make_db.new
      cache = db.get_cached(ARGV[0])
      if !cache.nil? && cache.length >0
        return WordCounter::parse_array

      end
    end
    def self.parse_array
      word_counts = []
      result = Result.new
      word_counts_rows[0...-1].each do |id, word, count|
        result.word_counts[word] = count
      end

      marks_count = word_counts_rows.last.last.to_i
      return result
    end

end
