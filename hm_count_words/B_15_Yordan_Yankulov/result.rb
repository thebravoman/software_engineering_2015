require 'json'
require 'rexml/document'
require 'csv'
class Result

  def initialize punct, helpe
    @punctuation = punct
    @help = helpe
  end
	def to_csv
    @help.each{ |element|
  	puts "#{element[0]},#{element[1]}"
  	}
  	if @punctuation!=0
  		puts "\"marks\", #{@punctuation}"
  	end
	end

	def to_json
  	if @punctuation != 0
  		puts JSON.pretty_generate("marks" => @punctuation,"words" => @help)
  	else
  		puts JSON.pretty_generate("words" => @help)
  	end
	end

	def to_xml
		my_xml = REXML::Document.new('')
		word_counts = my_xml.add_element('word-counts')
		if @punctuation != 0
			word_counts.add_element('marks').add_text"#{@punctuation}"
		end
		words = word_counts.add_element('words')
		@help.each do |key,count|
		word = words.add_element('word', {'count' => "#{count}"}).add_text"#{key}"
	end
	formatter = REXML::Formatters::Pretty.new
	formatter.compact = true
	formatter.write(my_xml, $stdout)
	end
end
