module WordCounter
  require_relative "word_counter/parser.rb"
  require_relative 'word_counter/result.rb'

  def self.parse_file(path, file_format)
    text = FileParser.new.parse(path)
    WordCounter.log_result(text, file_format)
  end

  def self.parse_webpage(url, file_format)
    text = WebpageParser.new.parse(url)
    WordCounter.log_result(text, file_format)
  end

  def parse
  end

  def self.parse_string(string, file_format)
    text = Parser.new.parse(string)
    WordCounter.log_result(text, file_format)
  end

  def self.log_result (text, file_format)
    result = Result.new
    result.word_counts(text)
    result.marks_count(text)

    case file_format
      when "json"
        result.to_json
      when "xml"
        result.to_xml
      else
        result.to_csv
    end
  end
end
