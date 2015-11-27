class Result
  attr_accessor :marks_count
  attr_accessor :word_counts
  def initialize
    @marks_count = 0
    @word_counts = Hash.new(0)
  end
  
  def to_csv
    word_counts.each do |word, number|
	puts word + ',' + number.to_s
    end
    if marks_count != 0
    	puts '"marks"'+','+marks_count.to_s
    end
  end

  def to_json
    tempHash = {
	"marks" => marks_count,
    	"words" => word_counts
    }
    puts JSON.pretty_generate(tempHash)
  end

  def to_xml
    xml_counts = REXML::Document.new("")
    xml_word_counts = xml_counts.add_element("word-counts")
    xml_marks = xml_word_counts.add_element("marks")
    xml_marks.add_text "#{markz_count}"
    xml_words = xml_word_counts.add_element("words")
    wordsnum.each do |index, key|
	word = xml_words.add_element('word')
	word.add_attribute("count", key.to_s)
    	word.add_text "#{index}"
    end
    xmlprint = ""
    xml_counts.write(xmlprint, 1)
    puts xmlprint
  end
end
