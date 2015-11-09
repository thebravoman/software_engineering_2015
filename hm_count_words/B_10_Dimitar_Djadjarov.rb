require 'csv'
require 'json'
require 'builder'
require 'rexml/document'
file = ARGV[0]
sett = ARGV[1]
class countwords
	def parse_file(file)
		res = open(file).read.split(' ')
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
word_counter = countwords.new
result = word_counter.parse_file ARGV[0]
if sett == "csv"
	result.to_csv
elsif sett == "json"
	puts result.to_json
elsif sett == "xml"
	puts result.to_xml
else
 	result.to_csv
end
