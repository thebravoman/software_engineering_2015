class Result
  attr_accessor :marks_count
  attr_accessor :word_counts
  def initialize 
    @marks_count = 0
    @word_counts = Hash.new(0)
  end

  def to_csv
    word_counts.each do|word, num|
      puts word+','+num.to_s
    end
    if marks_count!=0
      puts '"marks"'+','+marks_count.to_s
    end
  end


  def to_json
    json_hash = {
		"marks"=>marks_count,
		"words"=>word_counts
}
    json_hash2= JSON.pretty_generate(json_hash)		
  end


  def to_xml
  xml_new = REXML::Document.new('')
  xml_word_counts=xml_new.add_element('word-counts')
  xml_mrks =xml_word_counts.add_element('marks')
  xml_mrks.add_text "#{marks_count}"
  xml_words = xml_word_counts.add_element('words')
  word_counts.each do |word, count|
    word = xml_words.add_element('word', 'count' => count).text = "#{word}"
  end
  formatter = REXML::Formatters::Pretty.new(2)
  formatter.compact = true
  formatter.write(xml_new, $stdout)
  puts
  end

end
