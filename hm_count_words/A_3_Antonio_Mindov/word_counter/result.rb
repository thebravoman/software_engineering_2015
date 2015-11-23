require 'json'
require 'rexml/document'

class Result
	def initialize markCount, wordCounts
		@mark_count = markCount
		@word_counts = wordCounts
	end

	def to_csv
		my_csv = []
		@word_counts.each do |word, count|
			my_csv << word + ","+ count.to_s
		end

		if @mark_count > 0
			my_csv << '"marks",' + @mark_count.to_s
		end

		my_csv
	end

	def to_json
		jsonHash = {
			"marks" => @mark_count,
			"words" => @word_counts
		}
		jsonHash.to_json
	end

	def to_xml
		xml = REXML::Document.new('')	
		mainTag = xml.add_element('word-counts')
		mainTag.add_element('marks').add_text @mark_count.to_s
		wordsTag = mainTag.add_element('words')

		@word_counts.each do |word, count|
			wordsTag.add_element('word', {'count' => count}).add_text word
		end

		xml
	end
end