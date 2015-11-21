require 'csv'
require 'json'
require 'rexml/document'

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

