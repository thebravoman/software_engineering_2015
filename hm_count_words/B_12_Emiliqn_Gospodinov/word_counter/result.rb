require 'json'
require 'csv'
require 'rexml/document'

module WordCounter
  class Result
    def initialize
      @marks_counter = 0
      @word_count = {}
    end

    def setWordsMarks words, marks
      @word_count = words
      @marks_counter = marks
    end

    def to_csv
      @word_count.each do |elements|
        puts "#{elements[0]},#{elements[1]}"
      end
      if @marks_counter != 0
        puts '"marks",'+"#{@marks_counter}"
      end
    end

    def to_json
      puts JSON.generate("marks" => @marks_counter,"words" => @word_count)
    end

    def to_xml
      my_xml = REXML::Document.new('')
      word = my_xml.add_element('word-counts')
      word.add_element('marks').add_text"#{@marks_counter}"
      words_element = REXML::Element.new 'words'
      @word_count.each do |k,v|
        words_element.add_element('word',{'count' => v}).add_text("#{k}")
      end
      word.add_element(words_element)
      puts my_xml
    end
  end
end
