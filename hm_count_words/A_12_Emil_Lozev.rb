require 'csv'
require 'json'
require 'builder'
require 'rexml/document'

filename = ARGV[0]
option = ARGV[1]


class WordCounter
	
	def parse_file(filename)
		res = open(filename).read.split(' ')
		parse res
	end
	
	def parse(string)
		result = Result.new
		string.each do |word|
			result.marks_count += word.count(". , ! ? :  ; = + -  _ ' \"[ ] ( ) { } „ “ * / \ ")
		end
		
		string.map!{|item| item.gsub(/\p{^Alnum}/, '') }
		string.map!(&:downcase)
		string.delete("")

		hash = Hash.new(0)
		string.each do |word|
			hash[word] += 1
		end
		
		hash = hash.sort_by{|word, i| [-i, word]}
		result.word_counts = hash
		result
	end	
end



class Result
	attr_accessor :marks_count, :word_counts
	
	def initialize
		@marks_count = 0
		@word_counts = Hash.new
	end
	
	def to_csv
		@word_counts.each do |word,i|
			puts "#{word},#{i}"
		end
	puts "\"marks\",#{@marks_count}" if marks_count != 0		
	end
	
	def to_json
		hash = {
		"marks" => @marks_count,
		"words" => @word_counts,
	}
	puts JSON.pretty_generate(hash)
	end
	
	def to_xml
	
		xml = Builder::XmlMarkup.new(:indent => 2)
		xml.tag!("words-counts"){
	  	xml.marks @marks_count.to_s
	   	 xml.words {
	     	@word_counts.each do |word,i|
	     		xml.tag!('word', {'count' => i}, word)
	     	end 
	     	}
		}
		
	end
end

word_counter = WordCounter.new

result = word_counter.parse_file ARGV[0]


if option == "csv"
	result.to_csv
elsif option == "json"
	puts result.to_json
elsif option == "xml"
	puts result.to_xml
else
	puts result.to_csv
end
