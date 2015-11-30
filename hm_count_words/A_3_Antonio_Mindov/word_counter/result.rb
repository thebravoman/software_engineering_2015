require 'json'
require 'rexml/document'
module WordCounter
	class Result
		def initialize markCount, wordCounts
			@mark_count = markCount
			@word_counts = wordCounts
		end
	
		def to_csv
			my_csv = []
			@word_counts.each do |word, count|
				my_csv << word + ","+ count.to_s
			end
	
			if @mark_count > 0
				my_csv << '"marks",' + @mark_count.to_s
			end
	
			my_csv
		end
	
		def to_json
			jsonHash = {
				"marks" => @mark_count,
				"words" => @word_counts
			}
			jsonHash.to_json
		end
	
		def to_xml
			xml = REXML::Document.new('')	
			mainTag = xml.add_element('word-counts')
			mainTag.add_element('marks').add_text @mark_count.to_s
			wordsTag = mainTag.add_element('words')
	
			@word_counts.each do |word, count|
				wordsTag.add_element('word', {'count' => count}).add_text word
			end
	
			xml
		end

		def get_rect(x,y,w,h)
			'<rect width="' + w.to_s + '" height="' + h.to_s + '" x = "' + x.to_s + '" y = "' + y.to_s+ '" style="fill:blue;stroke-width:2;stroke:rgb(0,0,0)"/>'
		end

		def lerp(x,y,value)
			(y - x) * value
		end

		def to_svg
			c = 1
			width = 50
			offset = 20

			minWidth = 1.0
			maxWidth = 300.0

			maxCount = 0.0;

			File.open("result.svg","w") do |f|
      			f.write('<svg xmlns="http://www.w3.org/2000/svg">')

      			@word_counts.each do |word, count|

      				if(maxCount < count)
      					maxCount = count
      				end

      				height = lerp(minWidth.to_f,maxWidth.to_f, count.to_f/maxCount.to_f);

      				f.write(get_rect(c * (width + offset), offset + maxWidth - height, width, height))
      				f.write ('<text x="'+(c * (width + offset)).to_s+'" y="'+(offset + maxWidth + 10).to_s+'" style="writing-mode: tb;">'+word+'</text>')
      				c += 1
      			end
      			
      			f.write('</svg>');
      		end
		end
	end
end
