require 'json'
require 'rexml/document'
require 'csv'

module WordCounter
	class Result
		attr_accessor :marks_count
		attr_accessor :word_counts

		def initialize word_counts, marks_count
			@word_counts = word_counts
			@marks_count = marks_count
		end
		
		def to_json
			hash = {"marks" => @marks_count, "words" => @word_counts}
			File.open('result.json', 'w') {|json| json << JSON.pretty_generate(hash)}
			puts JSON.pretty_generate(hash)
		end

		def to_xml
			my_xml = REXML::Document.new('')
			word_counts_tag = my_xml.add_element('word-counts')
			marks_tag = word_counts_tag.add_element('marks')
			marks_tag.add_text(@marks_count.to_s)
			words_tag = word_counts_tag.add_element('words')
			@word_counts.each do |key, val|
				word_tag = words_tag.add_element('word',{'count' => val})
				word_tag.add_text(key)
			end
			formatter = REXML::Formatters::Pretty.new()
			formatter.compact = true
			File.open('result.xml', 'w') {|xml| formatter.write(my_xml, xml)}
			formatter.write(my_xml, $stdout)
			puts ""
		end
	
		def to_csv
			my_csv = CSV.generate(quote_char: "'") do |csv|
				@word_counts.to_a.each do |element|
					csv << element
				end
				unless @marks_count == 0
					csv << ['"marks"', @marks_count.to_s]
				end
			end
			File.open('result.csv', 'w') {|csv| csv << my_csv}
			puts my_csv
		end
	end
end













