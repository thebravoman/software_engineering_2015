require './B_14_Ivo_Gerginov/word_counter/result'

module WordCounter

  class Parser
  
  	def parseStr(f_str)
  	  w_count = Hash.new(0)
      marks = f_str.scan(/[\p{P}\p{S}]/u).count
	  f_str.each_line do |line|
        line = line.gsub!(/[\W+_\d+]/, " ")
        line = line.downcase
        words = line.split(/\W+/)

        words.each{ |x|	
      	  if w_count.has_key?("#{x}")
    	    w_count["#{x}"] += 1
      	  else
            w_count["#{x}"] = 1
      	  end
        } 
      end
      
      return Result.new(marks, w_count)
  	end
  end
end