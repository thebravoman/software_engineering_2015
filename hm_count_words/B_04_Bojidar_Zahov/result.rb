class Result
	attr_accessor :marks
	attr_accessor :words
	
	def initialize
		@marks = 0
		@words = Hash.new(0)
	end
	
	def to_json
		my_json = { "marks" => "#{@marks}".to_i, "words" =>@words, }
  		puts JSON.pretty_generate(my_json)
  		to_svg
	end

	def to_xml
		xml_counts = REXML::Document.new('')
		xml_word_counts = xml_counts.add_element('word-counts')
		xml_marks = xml_word_counts.add_element('marks')
		xml_marks.add_text"#{@marks}"
		xml_words = xml_word_counts.add_element('words')
		@words.each do |index, key|
			word = xml_words.add_element('word')
			word.add_attribute("count", key.to_s)
			word.add_text "#{index}"
		end
		xml_print = ""
 		xml_counts.write(xml_print,4)
  		puts xml_print
  		xml_print = REXML::Formatters::Pretty.new()
		
		File.open('result.xml', 'w') {|i| xml_print.write(xml_counts, i)}
		to_svg
	end
	def to_svg
		x=1
		y=7
		File.open("result.svg","w") do |f|
			f.write('<svg xmlns="http://www.w3.org/2000/svg">')
		     f.write(text x,y,"")
			@words.each do |element|
				f.write(text x,y,element.to_s.gsub(/[^a-z]/,''))
				
				(0..element.to_s.gsub(/[\W\D,]/,'').to_i - 1).each do |i|
					f.write(rect x+5+(i*10),y+5,6,6)
				end
				x,y = x+0,y+20
			end
			f.write('</svg>')
		end  
	end
	
	def to_csv
	to_svg
		my_csv = CSV.generate(quote_char: "'") do |csv|
			@words.each do |element|
				csv << element
			end
			if not @marks == 0
				csv << ['"marks"', @marks.to_s]
				#print "\"marks\",#{@marks}\n"
			end
			print my_csv
		end
	end
private
	def rect x, y, width, height
		'<rect width="'+width.to_s+'" height="'+height.to_s+'" x="'+x.to_s+'" y="'+y.to_s+'" style="fill:green;stroke-width:1;stroke:rgb(0,0,0)"/>'
	end
	def text x, y, text
		"<text x=\"#{x}\" y=\"#{y}\" fill=\"black\">#{text +":"}</text>"
	end
end
