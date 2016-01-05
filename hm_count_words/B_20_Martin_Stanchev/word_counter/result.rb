module WordCounter
  class Result
    attr_accessor :str
    attr_accessor :marks

    def initialize
      @str = Hash.new
      @marks = 0
    end


    def csv_format
      str.each do|index, key|
        puts index + ',' + key.to_s
      end

      if marks != 0
        puts "\"marks\"," + marks.to_s
      end
    end


    def json_format
      require 'json'

      my_json = { :marks => "#{marks}".to_i, :words => str, }
      puts JSON.pretty_generate(my_json)

    end


    def xml_format
      require 'rexml/document'

      xml_counts = REXML::Document.new("")

      xml_word_counts = xml_counts.add_element('word-counts')

      xml_marks = xml_word_counts.add_element('marks')
      xml_marks.add_text "#{marks}"

      xml_words = xml_word_counts.add_element('words')

      str.each do |index, key|
        word = xml_words.add_element('word')
        word.add_attribute( 'count', key)

        word.add_text "#{index}"
      end

      out = ""
      xml_counts.write(out, 1)
      puts out

    end

    def json_file
      require 'json'

      File.open("B_20_Martin_Stanchev.json", "w") do |f|
        my_json = { :marks => "#{marks}".to_i, :words => str, }
        f.write(JSON.pretty_generate(my_json))
      end

    end

  end
end
