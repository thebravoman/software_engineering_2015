require_relative 'result'
module WordCounter
class Parse

def folder_parse(folder)
	word_counter = Hash.new(0)
	marks = 0
	Dir.glob(folder).each do |txt|
 		file = File.open(txt, "r").read
 		marks += file.scan(/[\p{S}\p{P}]/u).count 
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
	end  
 		word_counter = word_counter.sort_by{|key, value|[-value, key]}
	
	Result.new(word_counter, marks) 
	
end
end
end
