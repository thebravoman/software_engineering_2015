require 'csv'
require 'json'
require 'rexml/document'

filename = ARGV[0]
output = ARGV[1]

class Result
	def intialize
		@mark_counts = 0
		@word_counts = Hash.new(0)
	end
 	
	attr_accessor :mark_count, :word_count

 	def to_csv
	 	@word_counts.each do |words,number|
		puts "#{words}, #{number}"
 		end
 
		if @mark_counts!=0
			puts "\"marks\", #{@mark_counts}"
  		end
 	end

 	def to_json
  		json_hash = Hash.new(0)
  		json_hash["marks"] = @mark_counts
  		json_hash["words"] = @word_counts
 		puts json_h.to_json
 	end

	def to_xml
    		xml_ = REXML::Document.new('') 
    		word_c_t = xml_.add_element('word-counts')
    		word_c_t.add_element('marks').add_text @mark_counts.to_s
    		words_t = word_count.add_element('words')

    		@word_counts.each do |word, count|
    		words_t.add_element('word', {'count' => count}).add_text word
    		end
    		formatter = REXML::Formatters::Pretty.new(4)
    		formatter.compact = true
    		formatter.write(xml_, $stdout)
 	end

end


class WordCounter
 	def parse(string)
 		
		marks = string.gsub(/[a-z\s]/, "");
		words = string.gsub(/[^a-z'\s-]/, "").split

		hash = Hash.new(0)

		words.each do |word|
			hash[word] += 1
		end
		
		hash = hash.sort_by{|word, count| [-count, word]}

		return Result.new(marks.length, hash)
	end

	def parse_file(filename)
		string = ""
		string = File.open(filename, "r").read.downcase
		return parse string    	
	end
end

result = (WordCounter.new).parse_file(ARGV[0])

if output == 'json'
  puts result.to_json
elsif output == 'xml'
  puts result.to_xml
else
  puts result.to_csv
end
