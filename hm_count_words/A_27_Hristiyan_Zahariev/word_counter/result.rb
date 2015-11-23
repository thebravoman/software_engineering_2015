class Result
  attr_accessor :markz_count
  attr_accessor :wordsnum
  def initialize
    @markz_count = 0
    @wordsnum = Hash.new(0)
  end
  
  def to_csv
    wordsnum.each do |word, number|
	puts word + ',' + number.to_s
    end
    if markz_count != 0
    	puts '"marks"'+','+markz_count.to_s
    end
  end

  def to_json
    tempHash = {
	"marks" => markz_count,
    	"words" => wordsnum
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
