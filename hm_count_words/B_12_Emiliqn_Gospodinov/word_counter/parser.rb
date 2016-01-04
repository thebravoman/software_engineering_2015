require_relative 'result'

BONUS_PIXELS = 15

module WordCounter
	class Parser
		def parse_string (string)
			result = Result.new
			result.marks_counter = string.scan(/[\p{P}\p{S}]/u).count
			words_num = 0

			string.each_line do |line|
				line.downcase.scan(/\b[A-Za-z0-9]+\b/i).each do |word|
					result.marks_counter += word.count(".,!?()[]\"")
					word = word.gsub(/[,()!.?_"]/,'')
						if result.word_counter.has_key?(word)
							result.word_counter[word]+=1
						else
							result.word_counter[word] = 1
							words_num = words_num + 1
						end
				end
			end
			result.word_counter=result.word_counter.sort_by{|k,v| [-v,k]}

			def gime_text x_,y_,word
				'<text x="'+x_.to_s+'" y="'+y_.to_s+'" fill="black">'+word.to_s+'</text>'
			end

			def gime_a_rect x_,y_,w_,h_
				'<rect x="'+x_.to_s+'" y="'+y_.to_s+'" width="'+w_.to_s+'" height="'+h_.to_s+'" 
				style="fill:rgb(0,255,0);stroke-width:2;stroke:rgb(0,0,0)" />'
			end

			max_width = 70*words_num
			max_height = result.word_counter[0][1]*20 + 100
			width_step = 10
			num_of_word = 0
			

			File.open("B_12_Emiliqn_Gospodinov.svg","w") do |f|
				f.write('<svg xmlns="http://www.w3.org/2000/svg" width="'+max_width.to_s+'" height="'+max_height.to_s+'">')
				f.write(gime_text 0,10,'"Marks":')
				f.write(gime_text 50,10,result.marks_counter)
				result.word_counter.each do |word|
					x = width_step
					height = 20*result.word_counter[num_of_word][1]
					h_step = max_height-height-25
					width = 60
					f.write(gime_a_rect width_step, h_step, width, height)
					f.write(gime_text x+width/2 , h_step+result.word_counter[num_of_word][1]*10 , result.word_counter[num_of_word][1])
					f.write(gime_text x+BONUS_PIXELS , h_step+height+BONUS_PIXELS , result.word_counter[num_of_word][0])
					width_step = width_step + 70
					num_of_word = num_of_word + 1
				end
				f.write('</svg>')
			end
			result	
		end
	end
end
