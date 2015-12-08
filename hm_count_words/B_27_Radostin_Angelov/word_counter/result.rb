module WordCounter
  require 'json'
  require 'csv'
  require 'rexml/document'

  class Result
    def initialize(words, marks)
	@words_count = words
	@marks_count = marks
    end

    def to_csv
	CSV.open("result.csv", "w", {:col_sep => ",",  :quote_char => "'"}) do |csv|
		@words_count.each do |word, count|
			puts "#{word},#{count}"
			csv << [word, count]
		end
		puts "\"marks\",#{@marks_count}"
		csv << ["\"marks\"", @marks_count] unless @marks_count == 0
	end
    end

    def to_xml
      xml_document = REXML::Document.new("")

      xml_word_counts = xml_document.add_element('word-counts')

      xml_marks = xml_word_counts.add_element('marks')
      xml_marks.add_text "#{@marks_count}"

      xml_words = xml_word_counts.add_element('words')
      @words_count.each do |word, count|
        xml_word = xml_words.add_element('word')
        xml_word.add_attribute('count', count)
        xml_word.add_text "#{word}"
      end

      xml_result = ""
      xml_document.write(xml_result, 1)
      puts xml_result
      File.open("result.xml", "w") do |file|
        file << xml_result
      end
    end

    def to_json
      result_json = {:marks => "#{@marks_count}".to_i, :words => @words_count}
      result_json = JSON.pretty_generate(result_json)
      puts result_json
      File.open("result.json", "w") do |file|
        file << result_json
      end
    end
  
	def to_svg
		rect_x = 20
		File.open("B_27_Radostin_Angelov.svg", "w") do
			|file|
				file << '<svg xmlns="http://www.w3.org/2000/svg" width="2000" height="300">'
				
				max_count = @words_count[0][1]
				
				percentage = @marks_count / max_count.to_f
				height = percentage * 200	
							
				@words_count.each do
				|pair|
					count = pair[1]				
					percentage = count / max_count.to_f
					height = percentage * 200
					
					file << print_rect(rect_x, 205, height, 10)
					file << print_text(rect_x - 7, 208, pair[0])
					
					rect_x += 10
				end
				
				file << '</svg>'
		end
	end
	
	def print_rect x,y,h,w
		return '<rect x="' + x.to_s + '" y="' + y.to_s + '" height="' + h.to_s + '" width="' + w.to_s + '" stroke="blue" fill="red" 
		transform="rotate(180, ' + x.to_s + ', ' + y.to_s + ')"/>' + "\n"
	end
	
	def print_text x, y, word
		return '<text x="' + x.to_s + '" y="' + y.to_s + '" font-family="Verdana" font-size="10"
				transform="rotate(90, ' + x.to_s + ', ' + y.to_s + ')">' + word + '</text>' + "\n"
	end
  end
end
