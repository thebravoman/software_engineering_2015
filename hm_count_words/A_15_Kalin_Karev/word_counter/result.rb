require 'json'
require 'rexml/document'
require 'csv'

module WordCounter
	class Result
		def initialize
			@counter = 0
			@answer = {}
		end

		def SetWordsMarks words, marks
			@answer = words
			@counter = marks
		end

		def marks_count
			@counter
		end


		def word_counts
			@answer
		end

		def to_csv
			res = ""
			@answer.each do |key, value| 
				puts "#{key},#{value}"	
			end
			if(@counter != 0)
				print "\"marks\",#{marks_count}"
			end
		end

		def to_json
			n_hash = {}
			n_hash[:marks] = @counter
			n_hash[:words] = @answer
			JSON.pretty_generate(n_hash)
		end


		def to_xml
			product = REXML::Document.new
			words_count = product.add_element("word-counts")
			marks = words_count .add_element("marks")
			marks.add_text "#{@counter}"
			words = words_count.add_element("words")
			@answer.each do |key, value|
			word = words.add_element("word")
			word.add_attribute("count", value)
			word.add_text "#{key}"
			end
			formatter = REXML::Formatters::Pretty.new(4)
			formatter.compact = true 				
			formatter.write(product, $stdout)
			""		
		end
		
		def rect x, y, w, h
		'<rect x="' + x.to_s + '" y = "' + y.to_s + '" width="' + w.to_s + '" height="' + h.to_s + '" style="fill:rgb(255,50,50)" />'
		end		
		
		def make_svg
			File.open("A_15_Kalin_Karev.svg","w") do |f|
				f.write('<svg xmlns="http://www.w3.org/2000/svg">')
				d = 20
				size = 15
				t = @answer[0]
				t = t.to_s
				t = t.delete('^0-9').to_i
				
				@answer.each do |key, value|
					f.write(rect d, 800 - ((500*value)/t), 50, ((500*value)/t) )
					size = 10 if(key.to_s.length > 7)
					f.write('<text x="'+d.to_s+'" y="'+((800 - ((501*value)/t)).to_s)+'" fill="red" font-size="'+size.to_s+'">'+key.to_s+' </text>')
				f.write('<text x="'+((d + 20).to_s)+'" y="820" fill="black" font-size="15">'+value.to_s+' </text>')
				d += 70
				size = 15
				end
				f.write('</svg>')
			end
		end

	end
end
