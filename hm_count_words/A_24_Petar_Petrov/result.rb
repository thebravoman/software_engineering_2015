class Result

  attr_accessor :marks_count, :words_count
  
  def initialize
    @marks_count = 0
    @words_count = {}
  end

  def to_json
    @words_count['words'] = @words_count['words'].to_a
    puts JSON.pretty_generate(@words_count)
  end
  
  def to_xml
    xml_doc = REXML::Document.new
    tag = REXML::Element.new('word-counts')
    tag.add_element('marks').add_text("#{@marks_count}")
    tag.add_element('words')
    @words_count['words'].each do |word, count|
      tag.elements['words'].add_element('word', {'count' => count}).add_text(word)
    end
    xml_doc << tag
    output = ''
    printer = REXML::Formatters::Pretty.new(4)
    printer.compact = true
    printer.write(tag, output)
    puts output
  end
  
  def to_csv
    words_count['words'].to_a.each do |word, count|
      puts word + ",#{count}"
    end
    puts "\"marks\",#{@marks_count}" if @marks_count > 0
  end
end
