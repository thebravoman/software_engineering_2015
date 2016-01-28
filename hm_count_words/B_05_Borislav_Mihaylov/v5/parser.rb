require_relative 'result.rb'
module WordCounter
	class Parser
	     
		def parse(string)
		pattern = /[,.!?'`<>*&$%^#|:+\-=;"({})\/\\\[\]@]/
	   	result = Result.new
	  	result.marks_sum = string.scan(pattern).count
	      	w = string.downcase.gsub(pattern, ' ').split(" ")
	  
		      	w.each do |word|
		    
		      		result.words[word] += 1
		      	end
	      
		result.words = result.words.sort_by{|words,number| words.downcase}
	      	result.words = result.words.sort_by{|words,number| [-number,words]}
		result
	  
	     	end
	end
end
