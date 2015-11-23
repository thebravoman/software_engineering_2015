module WordCounter
  require 'json'
  require 'csv'
  require 'rexml/document'

  class Result
    def initialize
    end

    def word_counts(text)
      @words_count = Hash.new(0)
      words = text.downcase.scan(/[a-zA-Z0-9]+/)

      words.each {
        |x|
        if @words_count.has_key?("#{x}")
          @words_count["#{x}"] += 1
        else
          @words_count["#{x}"] = 1
        end
      }
      @words_count = @words_count.sort_by {|word, count| [-count, word]}
    end

    def marks_count (text)
      @marks_count = text.scan(/[[:punct:]|+-=\/\\]/).size
    end

    def to_csv
      CSV.open("result.csv", "w") do |csv|
        @words_count.each do |word, count|
          puts "#{word},#{count}"
          csv << [word, count]
        end
        puts "\"marks\",#{@marks_count}"
        csv << ["\"marks\"", @marks_count]
      end
    end

    def to_xml
      xml_document = REXML::Document.new("")

      xml_word_counts = xml_document.add_element('word-counts')

      xml_marks = xml_word_counts.add_element('marks')
      xml_marks.add_text "#{@marks_count}"

      xml_words = xml_word_counts.add_element('words')
      @words_count.each do |word, count|
        xml_word = xml_words.add_element('word')
        xml_word.add_attribute('count', count)
        xml_word.add_text "#{word}"
      end

      xml_result = ""
      xml_document.write(xml_result, 1)
      puts xml_result
      File.open("result.xml", "w") do |file|
        file << xml_result
      end
    end

    def to_json
      result_json = { :words => @words_count, :marks => "#{@marks_count}".to_i}
      result_json = JSON.pretty_generate(result_json)
      puts result_json
      File.open("result.json", "w") do |file|
        file << result_json
      end
    end
  end
end
