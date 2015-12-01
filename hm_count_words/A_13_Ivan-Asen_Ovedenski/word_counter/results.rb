require 'json'
require 'rexml/document'

module WordCounter
	class Result
		def initialize(marksCount,wordCount)
			@marks_count = marksCount
			@word_count = wordCount
		end
	
		def to_csv
			@word_count.each { |word, count|  
			puts word + "," + count.to_s
				}
				if @marks_count > 0 
					puts "\"marks\", #{@marks_count}"
				end
		end
	
		def to_json
			json = {
				"marks" => @marks_count,
				"words" => @word_count.to_a
			}
			puts JSON.pretty_generate(json) 
		end
	
		def to_xml
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
		
		def to_svg
			y = 0
			x = 20
			File.open("result.svg" ,"w") do |f|
			f.write('<svg xmlns="http://www.w3.org/2000/svg">')
			@word_count.each do |word,count|
				y = 10*count
			 	f.write('<rect width="'+x.to_s+'" height="'+y.to_s+'" style="fill:blue;stroke-width:2;stroke:black" />')
			 	f.write('<text width="'+x.to_s+'" height="'+y.to_s+'" fill="blue"> </text>')
				x = x + 20
			end
			f.write('</svg>')
			end
		end
	end	
end

