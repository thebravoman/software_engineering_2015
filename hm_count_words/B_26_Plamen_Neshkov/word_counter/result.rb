require 'csv'
require 'json'
require 'rexml/document'

module WordCounter
  class Result
    attr_reader :marks_count, :word_counts

    def initialize(word_counts, marks_count)
      @marks_count = marks_count
      @word_counts = word_counts
    end

    def to_csv
      CSV.generate(quote_char: "'") do |csv|
        @word_counts.each do |word, occur|
          csv << [word, occur]
        end
        csv << ['"marks"', @marks_count] unless @marks_count == 0
      end
    end

    def to_json
      json_hash = { "marks": @marks_count, "words": @word_counts }
      JSON.generate(json_hash)
    end

    def to_xml
      document = REXML::Document.new
      word_counts = document.add_element('word-counts')
      word_counts.add_element('marks').add_text(@marks_count.to_s)
      words_element = word_counts.add_element('words')
      @word_counts.each do |word, occur|
        words_element.add_element('word')
          .add_text(word)
          .add_attribute('count', occur.to_s)
      end

      document.to_s
    end
  end
end
