require 'json'
require 'rexml/document'
require 'csv'

module WordCounter
	class Result
		attr_accessor :marks_count
		attr_accessor :word_counts
	
		def initialize
			@marks_count = 0
			@word_counts = {}	
		end
		
		def text(x,y,contents,color)
			'<text x="'+x.to_s+'" y="'+y.to_s+'" style="writing-mode: tb;" fill="'+color.to_s+'" font-size="20" transform="rotate('+x.to_s+','+y.to_s+')">'+contents+'
       </text>'
		end
			
		def rect(x, y, w, h)
			'<rect x="'+x.to_s+'" y="'+y.to_s+'" width="'+w.to_s+'" height="'+h.to_s+'" style="fill:blue;stroke:black;opacity:0.6;strokewidth:1;"/>'
		end

		def svg
			File.open('B_6_Valentin_Stoyanov.svg', 'w') do |f|
				ratio = 200.0 / @word_counts.values[0]
        f.write('<svg xmlns="http://www.w3.org/2000/svg">')
				h = 200
				w = 40
				holder = w 
				h = h + w
				i = 1
				@word_counts.each do |key, val|
	      	if i % 2 == 0
	        	col = 'black'
	       	else
	        	col = 'crimson'
	        end
	        value = val * ratio
	        f.write(rect(holder, h - value, w, value))
	        f.write(text(holder+w/2, h + w/5, key, col))
	       	holder = holder + w
					i += 1
				end
				f.write('</svg>')
      end
		end
	
		def to_json
			hash = {"marks" => @marks_count, "words" => @word_counts}
			File.open('result.json', 'w') {|json| json << JSON.pretty_generate(hash)}
			puts JSON.pretty_generate(hash)
		end

		def to_xml
			my_xml = REXML::Document.new('')
			word_counts_tag = my_xml.add_element('word-counts')
			marks_tag = word_counts_tag.add_element('marks')
			marks_tag.add_text(@marks_count.to_s)
			words_tag = word_counts_tag.add_element('words')
			@word_counts.each do |key, val|
				word_tag = words_tag.add_element('word',{'count' => val})
				word_tag.add_text(key)
			end
			formatter = REXML::Formatters::Pretty.new()
			formatter.compact = true
			File.open('result.xml', 'w') {|xml| formatter.write(my_xml, xml)}
			formatter.write(my_xml, $stdout)
			puts ""
		end
	
		def to_csv
			my_csv = CSV.generate(quote_char: "'") do |csv|
				@word_counts.to_a.each do |element|
					csv << element
				end
				unless @marks_count == 0
					csv << ['"marks"', @marks_count.to_s]
				end
			end
			File.open('result.csv', 'w') {|csv| csv << my_csv}
			puts my_csv
		end
	end
end
