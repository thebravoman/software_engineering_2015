module WordCounter
	require 'json'
  	require 'rexml/document'
  	require 'stringio'

  	class Result
    		MAX_BAR_HEIGHT = 200
    		MAX_BAR_WIDTH = 40

    		attr_reader :word_counts, :marks_count

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
      			ratio = MAX_BAR_HEIGHT / max_occur
      			
      			x = 0
      			y = 0
      			h = MAX_BAR_HEIGHT

      			File.open("B_08_Vanessa_Stoynova.svg", "w") do |file|
        			file.puts "<?xml version='1.0'?>"
        			file.puts "<svg width='" + (word_counts.length * MAX_BAR_WIDTH).to_s +
          			"' height='" + (MAX_BAR_HEIGHT + 50).to_s +
          			"' xmlns='http://www.w3.org/2000/svg'>"

        			word_counts.each do |word, count|
         				 bar_color = "%06x" % (rand * 0xffffff)
          				file.puts "<rect height='#{h.to_s}' width='#{MAX_BAR_WIDTH.to_s}' " +
          				"x='#{x.to_s}' y='#{y.to_s}' stroke-width='0' fill='##{bar_color}'/>"

          				x, y, h = get_next_word_rectangle(x, ratio, max_occur, count)
        			end

        			file.puts "</svg>"
      			end
    		end

    		private
    			def get_next_word_rectangle(current_x, ratio, max_occur, curr_occur)
      				x = current_x + MAX_BAR_WIDTH
      				y = (max_occur - curr_occur) * ratio
      				height = MAX_BAR_HEIGHT - y
      				return x, y, height
    			end
  	end
end
