require 'json'
require 'rexml/document'
require 'csv'

module WordCounter
	class Result
		attr_accessor :marks_count
		attr_accessor :word_counts
	
		def initialize
			@marks_count = 0
			@word_counts = Hash.new(0)
		end
	
		def to_json
			hash = Hash.new(Hash.new(0))
			hash = {"marks" => @marks_count, "words" => @word_counts}
			JSON.pretty_generate(hash)
		end

		def to_xml
			my_xml = REXML::Document.new('')
			word_counts_tag = my_xml.add_element('word-counts')
			marks_tag = word_counts_tag.add_element('marks')
			marks_tag.add_text(@marks_count.to_s)
			words_tag = word_counts_tag.add_element('words')
			@word_counts.each do |element|
				word_tag = words_tag.add_element('word',{'count' => element[1]})
				word_tag.add_text(element[0])
			end
			formatter = REXML::Formatters::Pretty.new()
			formatter.compact = true
			File.open('result.xml', 'w') {|xml| formatter.write(my_xml, xml)}
			formatter.write(my_xml, $stdout)
		end
	
		def to_csv
			my_csv = CSV.generate(quote_char: "'") do |csv|
				@word_counts.each do |element|
					csv << element
				end
				if not @marks_count == 0
					csv << ['"marks"', @marks_count.to_s]
				end
				my_csv
			end
		end
	end
end
