require 'json'

module WordCounter
  # Represents the result of counting words
  class Result
    private

    def add_words_to_xml(xml_doc)
      words = xml_doc.elements['word-counts/words']

      word_counts.each do |word, count|
        word_element = words.add_element 'word'
        word_element.add_attribute 'count', count
        word_element.add_text "#{word}"
      end
    end

    public

    attr_accessor :marks_count
    attr_accessor :word_counts

    def initialize
      @marks_count = 0
      @word_counts = Hash.new 0
    end

    def to_json
      json_output = word_counts.clone
      json_output['"marks"'] = @marks_count if @marks_count > 0
      JSON.pretty_generate(json_output)
    end
  end
end
