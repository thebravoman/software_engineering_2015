
class Result
	def initialize markCount, wordCount
		@mark_count = markCount
		@word_count = wordCount
	end

	def to_csv
		@word_count.each do |word, count|
			puts word + "," + count.to_s
		end

		if @mark_count > 0
			puts '"marks",' + @mark_count.to_s
		end
	end

	def to_json
		jsonHash = {
			"marks" => @mark_count,
			"words" => @word_count
		}
		puts jsonHash.to_json
	end

	def to_xml
		xml = REXML::Document.new('')	
		mainTag = xml.add_element('word-counts')
		mainTag.add_element('marks').add_text @mark_count.to_s
		wordsTag = mainTag.add_element('words')

		@word_count.each do |word, count|
			wordsTag.add_element('word', {'count' => count}).add_text word
		end

		formatter = REXML::Formatters::Pretty.new(4)
		formatter.compact = true
		formatter.write(xml, $stdout)
	end
end
