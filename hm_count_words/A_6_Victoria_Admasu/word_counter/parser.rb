require_relative 'result'

module WordCounter
	class Parser
		def parse(string)
		    result = Result.new
		    string = string.downcase.split
		
		    string.each { |word|
		    	$marks += word.count("-_,.;:!?='""|(){}[]/")
		    	word = word.gsub(/[^A-Za-z]/, ' ')
		    	if $count.has_key?(word)
		    		$count[word] += 1
		    	else
		    		$count[word] = 1
		    	end
		    } 
		
		    $count = $count.sort_by {|x, y| [-y, x]}
		
		    result.inititalize($count, $marks)
		    result
		end
	end
end