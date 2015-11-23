require 'csv'
require 'json'
require 'rexml/document'

module WordCounter
  class Result
    attr_accessor :marks_count, :word_counts

    def initialize(word_list, marks_count)
      @word_counts = word_list
      @marks_count = marks_count
    end

    def to_csv
      CSV.open("result.csv","w") do |csv|
        @word_counts.each do |key, val|
          csv << [key, val]
          puts "#{key},#{val}"
        end
        csv << ["marks", @marks_count] if @marks_count > 0
        puts "\"marks\",#{@marks_count}" if @marks_count > 0
      end
    end

    def to_json
      File.open("result.json", "w") do |file|
        word_format = []
        @word_counts.each { |k, v| word_format.push([k, v]) }
        json_format = {
          "marks" => @marks_count,
          "words" => word_format
        }
        json = JSON.pretty_generate(json_format)
        file << json

        json
      end
    end

    def to_xml
      xml = REXML::Document.new

      words_counts_e = xml.add_element("word-counts")
      words_counts_e.add_element("marks").add_text("#{@marks_count}")
      words_xml = words_counts_e.add_element("words")

      @word_counts.each do |key, val|
        word = words_xml.add_element("word")
        word.add_attribute("count", val)
        word.add_text("#{key}")
      end

      output = ''
      xml.write(output, 1)
      File.open("result.xml", "w") { |file| file << output }
      output
    end
  end
end
