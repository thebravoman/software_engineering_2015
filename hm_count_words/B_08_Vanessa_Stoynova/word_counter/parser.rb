require_relative 'result'

module WordCounter

	class Parser
  
   	def bar_drawer x, y, w, h
     		'<rect x = "'+x.to_s+'" y = "'+y.to_s+'" width = "'+w.to_s+'" height = "'+h.to_s+'" style = "fill:rgb(0,191,255);stroke-width:2;stroke:rgb(0,0,0)"/>'
   	end 
   
   	def text x, y, word
     		'<text x = "'+x.to_s+'" y = "'+y.to_s+'" fill = "purple">'+word.to_s+'</text>'
   	end
    
   	def parse_string (string)
    		result = Result.new
    		result.marks = string.scan(/[\p{P}\p{S}]/u).count
    		counter = string.scan(/\w+/).count
    		counter = counter * 55
   		string = string.downcase.split
    		string.each do |word|
      			word = word.gsub(/[\W+_]/, ' ')
      			if(word.include?(" "))
        			word = word.split(" ")
        			word.each do |b|
          				result.word_counter[b] = 1
        			end
       		else if !word.empty?
          			result.word_counter[word] += 1
        		end
      		end
    	end
    	
    	result.word_counter = result.word_counter.sort_by { |key, value| [-value, key] }
    	height_counter = 650
    	if(600 / result.word_counter[0][1] < 30)
      		a = result.word_counter[0][1] - 22
      		height_counter = height_counter + a * 50
    	end
    	no_name = 0
    	result.word_counter.each do |all|
      	no_name = no_name + 1
    	end
    	width_counter = 600 + 70 * no_name
   	i = 5
    	j = 0
    	File.open("result.svg", "w") do |f|
     		f.write('<svg xmlns="http://www.w3.org/2000/svg" width="'+width_counter.to_s+'" height="'+height_counter.to_s+'">')
      		f.write(text(5, 35, "\"Marks\":"))
      		f.write(text(75,35, result.marks))   
      		
         	result.word_counter.each do |c|
          		x = 0 + i
          		word_x = x
          		height = 30 * result.word_counter[j][1]
          		y = height_counter-height - 50
          		width = 60
          		letter_counter = result.word_counter[j][0].gsub(/[A-Za-z]/).count
          		
          		if(letter_counter > 6)
            			word_x = word_x - 15          
          		end
          		f.write(bar_drawer(x,y,width,height))
          		f.write(text(x+15, y-15, result.word_counter[j][1]))
          		if(j % 2 == 0)
            			f.write(text(word_x + 15, y + height + 15, result.word_counter[j][0]))
          		else 
            			f.write(text(word_x + 15, y + height + 30, result.word_counter[j][0]))
          		end
          		j = j + 1
          		i = i + 70
         	end      
      		f.write('</svg>')
    	end
   	result
   end
   
  end
  
end
