module WordCounter
	class SVGenerator
	private
		MAX_HEIGHT = 200
		WIDTH = 20
		TXT_XOFFSET = WIDTH / 2
		TXT_YOFFSET = (WIDTH / 5) + TXT_XOFFSET
		EMPTY = 0
		DEFAULT = 1
		def self.text x, y, color, text
			'<text x="'+x.to_s+'" y="'+y.to_s+'" style="writing-mode: tb;" fill="'+color.to_s+'" font-size="20" transform="rotate('+x.to_s+','+y.to_s+')">'+text+'</text>'
		end
		
		def self.bar x, y, w, h, color
			'<rect x="'+x.to_s+'" y="'+y.to_s+'" width="'+w.to_s+'" height="'+h.to_s+'" style="fill:'+color.to_s+';stroke:black;opacity:0.6;strokewidth:1;"/>'
		end
		
		def self.save_in_file code
			File.open('B_6_Valentin_Stoyanov.svg', 'w') do |svg|
				svg.write code
			end
		end
		
public
		def self.draw words, marks
			svg_code = ''
			ratio = MAX_HEIGHT
			highest_wc = words.values.first.to_f
			if highest_wc == EMPTY
				ratio /= DEFAULT
			else
				ratio /= highest_wc
			end
			svg_code << '<svg width="'+((words.size * WIDTH) + WIDTH).to_s+'" height="'+(MAX_HEIGHT * 2).to_s+'"  xmlns="http://www.w3.org/2000/svg">'
			offset = WIDTH
			color_counter = 1
			words.each do |word, occur|
				if color_counter == 1
					color = 'blue'
					color_counter = 0
				else
					color = 'deeppink'
					color_counter = 1
				end
				svg_code << bar(offset, MAX_HEIGHT - (occur * ratio) + TXT_XOFFSET, WIDTH, occur * ratio, color)
				svg_code << text(offset + TXT_XOFFSET, MAX_HEIGHT + TXT_YOFFSET, color, word)
				offset += WIDTH
			end
			svg_code << '</svg>'
			save_in_file svg_code
		end
	end
end
