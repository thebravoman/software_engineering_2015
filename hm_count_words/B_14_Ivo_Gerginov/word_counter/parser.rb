require_relative 'result'

module WordCounter

  class Parser
  
  	def parseStr(f_str, fPath)
  	  w_count = Hash.new(0)
      marks = f_str.scan(/[\p{P}\p{S}]/u).count
	  f_str.each_line do |line|
        line = line.gsub!(/[\W+_]/, ' ')
        words = line.to_s.downcase.split
        words.each{ |x|	
      	  if w_count.has_key?("#{x}")
    	    w_count["#{x}"] = 1
      	  else
            w_count["#{x}"] = 1
      	  end
        } 
      end
      
      return Result.new(marks, w_count, fPath)
  	end
  end
end