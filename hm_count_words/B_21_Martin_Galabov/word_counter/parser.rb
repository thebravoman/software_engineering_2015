require_relative 'result'
module WordCounter
class Parse
def akbar_draw x, y, w, h
	'<rect x = "'+x.to_s+'" y = "'+y.to_s+'" width = "'+w.to_s+'" height = "'+h.to_s+'" style = "fill:green; stroke_width:2; stroke:black "/>'
end

def text_write x, y, word
	'<text x = "'+x.to_s+'" y = "'+y.to_s+'" "fill = black">'+word.to_s+'</text>'
end

def parse(txt)
	word_counter = Hash.new(0)
 		marks = 0 
 		file = txt
 		marks = file.scan(/[\p{S}\p{P}]/u).count 
 		file.each_line do |line|  
 			words = line.downcase.split   
 			words.each do |word|  
 				word = word.gsub(/[\W+ ._\s]/, ' ')
 				if (word.include?(" "))
 				word = word.split(" ")
 				word.each do |splits|  
 				word_counter[splits] += 1
 				end
 				elsif !word.empty?
 					word_counter[word] += 1
 				end
 			end   
 		end  
 		word_counter = word_counter.sort_by{|key, value|[-value, key]}
	#	k = 0
#	File.open("B_21_Martin_galabov.svg", "w") do |file|
 #    file.write('<svg xmlns="http://www.w3.org/2000/svg" >')
  #       word_counter.each do |c|
   #       x = 0
   #       y = 0
    #      height = 20
    #      width = 10*word_counter[k][1]
     #     file.write(akbar_draw(x,y,width,height))
    #      file.write(text_write(x+15,y+15,word_counter[k][1]))
   #       y += 30
   #       k+=1
    #     end      
    #  file.write('</svg>')
  #  end
		Result.new(word_counter, marks) 
	
	end
end
end
