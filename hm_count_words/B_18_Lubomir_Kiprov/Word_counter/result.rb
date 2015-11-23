require 'csv'
require 'json'
require 'rexml/document'

module Word_counter

class Result

  attr_accessor :countmarks
  attr_accessor :wordhash
  def initialize(wordhash , countmarks)
    @countmarks = countmarks
    @wordhash = wordhash
  end
  def to_csv
    wordhash.each do |word, i|
      puts "#{word},#{i}"
    end
    puts  "\"marks\",#{countmarks}" if countmarks != 0
  end
  def to_json
    require 'json'
    json_output = { marks: countmarks, words: wordhash }
    JSON.pretty_generate(json_output)
  end
  def to_xml
    xml= REXML::Document.new()
	xmlwcount = xml.add_element('word-counts')
	xmlmarks = xmlwcount.add_element('marks')
	xmlmarks.add_text "#{countmarks}"
	xmlwords = xmlwcount.add_element('words')
	
	wordhash.each do |k, v|
		word = xmlwords.add_element('word')
		word.add_attribute('count', v)
		word.add_text "#{k}"
	end
	
	output = REXML::Formatters::Pretty.new
	output.compact = true
  	output.write(xml, $stdout)
  	puts
  end
end
end

