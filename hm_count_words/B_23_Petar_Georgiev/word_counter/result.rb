require 'rexml/document'
require 'csv'
require 'json'

module word_Count
class Result
  attr_reader :marks_count, :word_counts

  def initialize(word_count, marks_count)
    @marks = marks_count
    @words = word_count
  end

  def to_json
    json_hash = { "marks": @marks, "words": @words }
    JSON.generate(json_hash)
  end

  def to_xml
    file = REXML::Document.new('')
    word_counts = file.add_element('word-counts')
	  marks = word_counts.add_element('marks').text = "#{@marks}"
	  wordz = word_counts.add_element('words')
    @words.each do |a, b|
	    word = wordz.add_element('word', 'count' => "#{b}").text = "#{a}"
    end
    file.to_s
  end
  def to_csv
    csv_file = []
        @words.each do |a, b|
            csv_file << a + ',' + b.to_s
        end
        if @marks != 0
            csv_file << "\"marks\"," + @marks.to_s
        end
  end
end
