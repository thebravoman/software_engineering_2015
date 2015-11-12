require 'json'
require 'rexml/document'
require 'csv'

@format = ARGV[1]
@file = File.open(ARGV[0], "r")

class WordCounter
	def parse(string)
		result = Result.new
		result.marks_count = string.scan(/[,.!?()":\[\];]/).count
		string = string.downcase.split

		string.each do |word|
			word = word.gsub(/[,.!?()":\[\];]/,'')
			result.word_counts[word] += 1 
		end

		result.word_counts = result.word_counts.sort_by {|word,num| [-num,word] }
		
		result
	end

	def parse_file(filename)
		file_content = filename.read
		parse file_content
	end
end

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
		output = ""
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
		formatter.write(my_xml, $stdout)
		print
		
	end
	
	def to_csv
		my_csv = CSV.generate do |csv|
			@word_counts.each do |element|
				csv << element
			end
			if not @marks_count == 0
				csv << ["marks,", @marks_count.to_s]
			end
			my_csv
		end
	end
end

word_counter = WordCounter.new
result = word_counter.parse_file @file

case @format
when "json"
	puts result.to_json
when "xml"
	puts result.to_xml
else 
	puts result.to_csv
end
