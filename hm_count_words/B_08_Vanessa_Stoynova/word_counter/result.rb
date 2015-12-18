module WordCounter

	require 'json'
  	require 'rexml/document'
  	require 'stringio'

  	class Result
  	
  		BAR_HEIGHT = 1000
  		BAR_WIDTH = 20
		

    		attr_reader :word_counts, :marks_count

		def add_text x, y, word
			'<text x="'+x.to_s+'" y="'+y.to_s+'" fill="black">'+word.to_s+'</text>'
		end
		
		def draw_bar x, y, w, h
			'<rect x="'+x.to_s+'" y="'+y.to_s+'" width="'+w.to_s+'" height="'+h.to_s+'" fill="pink" style="stroke-width:2;stroke:rgb(0,0,0)"/>'
		end

    		def initialize(word_counts, marks_count)
      			@word_counts = word_counts
      			@marks_count = marks_count
    		end

    		def to_csv
      			result = StringIO.new
      			word_counts.each do |word, occurence|
        			result << "#{word},#{occurence}\n"
      			end

      			if marks_count > 0
        			result << "\"marks\",#{marks_count}\n"
      			end

      			result.string
    		end

    		def to_json
      			hash_format = {
        			"marks" => marks_count,
        			"words" => word_counts
      			}

      			JSON.pretty_generate(hash_format)
    		end

    		def to_xml
      			doc = REXML::Document.new
      			doc.context[:attribute_quote] = :quote
      			
      			word_counts_element = doc.add_element('word-counts')
      			marks_element = word_counts_element.add_element('marks')
      			marks_element.add_text(marks_count.to_s)

      			words_element = word_counts_element.add_element('words')

      			word_counts.each do |word, count|
        			word_element = words_element.add_element('word')
        			word_element.add_attributes({'count' => count.to_s })
        			word_element.add_text(word)
      			end

      			formatter = REXML::Formatters::Pretty.new(4)
      			formatter.compact = true
      			result = ''
      			formatter.write(doc, result)
      			result
    		end

    		def to_svg
    		
      			max_occur = word_counts[0][1]
      			ratio = BAR_HEIGHT / max_occur
      			
      			x = 0
      			y = 0
      			h = 20
      			w = 50

      			File.open("B_08_Vanessa_Stoynova.svg", "w") do |file|
        			file.write('<svg xmlns="http://www.w3.org/2000/svg" width="1000" height="1000">')

        			word_counts.each do |word, count|
        			
         				file.write(draw_bar(x, y, w, h*count))
         				file.write(add_text(5, 35, "\"Marks\":"))
      					file.write(add_text(75,35, word)) 
          				x, y, h = get_next_word_rectangle(x, ratio, max_occur, count)
        			end

        			file.puts "</svg>"
      			end
    		end

    		private
    			def get_next_word_rectangle(current_x, ratio, max_occur, curr_occur)
      				x = 1000
      				y = (max_occur - curr_occur) * ratio
      				height = 20
      				return x, y, height
    			end
  	end
end
