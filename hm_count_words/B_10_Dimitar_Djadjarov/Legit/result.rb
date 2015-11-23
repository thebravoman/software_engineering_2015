require 'rexml/document'
require 'csv'
require 'json'
module WordCounter
  class Result
    def initialize
      @marks_count = 0
      @word_counts = {}
    end
    def setWordsMarks words, marks
      @word_counts = words
      @marks_count = marks
    end
    def to_csv
      @word_counts.each do |elements|
        puts "#{elements[0]},#{elements[1]}"
      end
      if @marks_count != 0
        puts '"marks",'+"#{@marks_count}"
      end
    end
    def to_json
      puts JSON.generate("marks" => @marks_count,"words" => @word_counts)
    end
    def to_xml
      my_xml = REXML::Document.new('')
      word = my_xml.add_element('word-counts')
      word.add_element('marks').add_text"#{@marks_count}"
      words_element = REXML::Element.new 'words'
      @word_counts.each do |k,v|
        words_element.add_element('word',{'count' => v}).add_text("#{k}")
      end
      word.add_element(words_element)
      puts my_xml
    end
  end
end
