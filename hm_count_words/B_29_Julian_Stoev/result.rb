require 'json'
require 'rexml/document'

class Result
	
	attr_accessor :sumofmarks, :words_hash

	def initialize(words_hash, sumofmarks)
		@sumofmarks = sumofmarks
		@words_hash = words_hash
	end

	def marks_count
		if sumofmarks != 0 
			puts "marks,#{sumofmarks}"
		end
	end

	def word_count
		words_hash.each do |key, value|
			puts "#{key},#{value}"
		end
	end

	def to_csv
		words_hash.each do |key, value|
			puts "#{key},#{value}"
		end	
		if sumofmarks != 0 
			puts "\"marks\",#{sumofmarks}"
		end
	end

	def to_json
		content_hash = Hash.new(0)
		content_hash["marks"] = sumofmarks
		content_hash["words"] = words_hash
		puts JSON.pretty_generate(content_hash)
	end

	def to_xml
		file_xml = REXML::Document.new('')
		word_count = file_xml.add_element('word-counts')
		marks_xml = word_count.add_element('marks').add_text(sumofmarks.to_s)
		words_xml = word_count.add_element('words')
		words_hash.each do |key, value|
			words_xml.add_element('word').add_text(key).add_attribute('count', value.to_s)
		end
		form = REXML::Formatters::Pretty.new
 		form.compact = true
 	 	form.write(file_xml, $stdout)
 	 	puts
	end
end
