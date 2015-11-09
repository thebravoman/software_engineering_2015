require 'json'
require 'rexml/document'
<<<<<<< HEAD

class Result
	def initialize(marksCount,wordCount)
		@marks_count = marksCount
		@word_count = wordCount
	end
	
	def get_csv
		@word_count.each { |word, count|  
		puts word + "," + count.to_s
			}
			if @marks_count > 0 
				puts "\"marks\", #{@marks_count}"
			end
	end
	
	def get_json
		puts @word_count
		json = {
			"marks" => @marks_count,
			"words" => @word_count.to_a
=======
format = ARGV[1]
h = Hash.new 
marks = 0
file = File.open(ARGV[0], "r")
file.each_line { |line|
  marks += line.scan(/[,.!?:;"()\[\]]/).count 	
  words = line.gsub(/[^a-z'^A-Z'\s-]/, '').split
  words.each { |w|
  	w.downcase!
  	if h.has_key?(w) 
  		h[w] = h[w] + 1 
	else
   		h[w] = 1 
  	end	
   	}
  }
if format == 'json'
	json = {
		"marks" => marks,
		"words" => h.to_a
	}
	puts JSON.pretty_generate(json) 
	#puts json.to_json
elsif format == 'csv'
	h.sort{|a,b| a <=> b}.each { |word|  
	puts "#{word[0]},#{word[1]}" 
>>>>>>> c2bc8aa9394f76bd637f19591222a1bbacaf62c6
		}
		puts JSON.pretty_generate(json) 
	end
	
	def get_xml
		my_xml = REXML::Document.new
		body = my_xml.add_element('word-counts') 
		body.add_element('marks').add_text @marks_count.to_s
		words = body.add_element('words') 
	
		@word_count.each do |word, count| 
			words.add_element('word', {'count' => count}).add_text word 
		end 
	
		printer = REXML::Formatters::Pretty.new(4) 
		printer.compact = true 
		printer.write(my_xml, $stdout)	
	end
end

class WordCounter 

	def parse_file(file)
		text = File.open(file, "r")
		parse(text)
	end

	def parse(text)
		marks = 0
		h = Hash.new(0)
		text.each_line { |line|
  			marks += line.scan(/[,.!?:;"()\[\]]/).count 
			words = line.gsub(/[^a-z'^A-Z'\s-]/, '').split
			words.each { |w|
				w.downcase!
				if h.has_key?(w) 
					h[w] = h[w] + 1 
				else
					h[w] = 1 
				end	
			}
			h.sort{|a,b| a <=> b}
		}
		Result.new(marks,h)
	end
end

result = (WordCounter.new).parse_file(ARGV[0])
#result.parse_file(ARGV[0])

if ARGV[1] == 'json'
	result.get_json
elsif ARGV[1] == 'xml'
	 result.get_xml
else 
	result.get_csv
end
