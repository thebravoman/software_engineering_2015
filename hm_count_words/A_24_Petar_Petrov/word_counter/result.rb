require_relative 'svg_parser'
require 'sqlite3'
require_relative 'db_parser'

module WordCounter  
  class Result

    attr_accessor :marks_count, :word_counts
    
    def initialize
      @marks_count = 0
      @word_counts = {}
    end

    def to_json
      @word_counts['words'] = @word_counts['words'].to_a
      puts JSON.pretty_generate(@word_counts)
    end
    
    def to_xml
      xml_doc = REXML::Document.new
      tag = REXML::Element.new('word-counts')
      tag.add_element('marks').add_text("#{@marks_count}")
      tag.add_element('words')
      @word_counts['words'].each do |word, count|
        tag.elements['words'].add_element('word', {'count' => count}).add_text(word)
      end
      xml_doc << tag
      output = ''
      printer = REXML::Formatters::Pretty.new(4)
      printer.compact = true
      printer.write(tag, output)
      puts output
    end
    
    def to_svg
    	SVGParser.create_graph(@word_counts)
    end
    
    def to_csv
      @word_counts['words'].to_a.each do |word, count|
        puts word + ",#{count}"
      end
      puts "\"marks\",#{@marks_count}" if @marks_count > 0
    end
    
    def to_db(filename)
			db = DatabaseParser.create_db
			DatabaseParser.update_db(@word_counts,db,filename)
    end
  end
end
