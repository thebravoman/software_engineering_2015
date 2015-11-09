require 'json'
require 'rexml/document'

class WordCounter
	def parse txt
		words_hash = Hash.new(0)

		sumofmarks = txt.scan(/[[:punct:]]/).length

		content = txt.downcase.tr('^A-Z ^0-9 ^a-z', '').split(' ')
		content.each do |word|
			words_hash[word] = words_hash[word]+1 
		end

		words_hash = words_hash.sort_by {|key, value| [-value, key]}	
		
		Result.new(words_hash, sumofmarks)
	end

	def parse_file file
		txtfile = File.open(file, "r")
		txt = IO.read(txtfile)
		parse txt
	end
end

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
		word_count = file_xml.add_element('word-count')
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

word_counter = WordCounter.new
result = word_counter.parse_file(ARGV[0])  ## .to_s ???

if (ARGV[1]=='json')

	result.to_json

elsif (ARGV[1]=='xml')

	result.to_xml

elsif (ARGV[1]=='marks')

	result.marks_count

elsif (ARGV[1]=='words')

	result.word_count

elsif (ARGV[1]=='csv' || ARGV[1].nil?) 
	
	result.to_csv

end
=begin ##Old Program


content_hash = Hash.new(0)
words_hash = Hash.new(0)
txtfile = File.open(ARGV[0], "r")

sumofmarks = IO.read(txtfile).scan(/[[:punct:]]/).length

content = IO.read(txtfile).downcase.tr('^A-Z ^0-9 ^a-z', '').split(' ')
content.each do |word|
	words_hash[word] = words_hash[word]+1 
end

words_hash = words_hash.sort_by {|key, value| [-value, key]}

if (ARGV[1]=='json')
	content_hash["marks"] = sumofmarks
	content_hash["words"] = words_hash
	puts JSON.pretty_generate(content_hash)

elsif (ARGV[1]=='xml')
	file_xml = REXML::Document.new('')
	word_count = file_xml.add_element('word-count')
	marks_xml = word_count.add_element('marks').add_text(sumofmarks.to_s)
	words_xml = word_count.add_element('words')
	words_hash.each do |key, value|
		words_xml.add_element('word').add_text(key).add_attribute('count', value.to_s)
	end
	form = REXML::Formatters::Pretty.new
 	form.compact = true
  	form.write(file_xml, $stdout)
  	puts

else
	words_hash.each do |key, value|
		puts "#{key},#{value}"
	end	
	if sumofmarks != 0 
		puts "\"marks\",#{sumofmarks}"
	end
end


=end
