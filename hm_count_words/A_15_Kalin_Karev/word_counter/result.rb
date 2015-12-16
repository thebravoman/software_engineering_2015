require 'json'
require 'rexml/document'
require 'csv'

module WordCounter
	class Result
		def initialize(answer, counter)
			@answer = answer
			@counter = counter
		end


		def marks_count
			@counter
		end


		def word_counts
			@answer
		end

		def to_csv
			res = ""
			@answer.each do |word, i|
				res = res + "#{word},#{i.to_s}\n"		
			end
			res
		end

		def to_json
			json_h = {
				"marks"=>@counter,
				"words"=>@answer
			}
			json_2 = JSON.pretty_generate(json_h)
		end


		def to_xml
			product = ""
			final_xml = REXML::Document.new("")
	  		words_xml = final_xml.add_element("word-counts")
	  		marks_xml = words_xml.add_element("marks")
	  		marks_xml.add_text "#{@counter}"
	  		words_final = words_xml.add_element("words")
	  
	  		@answer.each do |index, key|
	    			word = words_final.add_element('word')
	    			word.add_attribute( 'count', key)
	   			word.add_text "#{index}"
	   		end
	  		final_xml.write(product, 1)
	  		product	
		end

def rect x,y,width,height
	'<rect width="'+width.to_s+'" y ="'+y.to_s+'" x ="'+x.to_s+'" height="'+height.to_s+'" style="fill:rgb(0,0,0);stroke-width:3;stroke:rgb(0,0,0)"/>'
end		
		
		def to_svg
			File.open("result.svg","w") do |f|
				f.write('<svg xmlns="http://www.w3.org/2000/svg">')
				t = @answer.first.last
				y = t
				t = (t/200) + 1
				x = 40
				@answer.each do |word, n|
					t_y = (300-y)-y
					f.write(rect(x,t_y,30,t*n*10))
					f.write('<text x="'+(x+2).to_s+'" y="'+(t_y-7).to_s+'" textLength = "'+(word.length*5).to_s+'" fill="black">'+word+'</text>')
					x += 60
				end
				f.write('</svg>')
			end
		end

	end
end
