 require_relative 'result.rb'
 module WordCounter
 	class Parser
		 def parse(string)
		    result = Result.new
		    result.marks_count = string.count(".,=[]()'!{}?:_;\"")
		    string = string.gsub(/[^A-Za-z]/, ' ').downcase
		    word_list = string.split(' ')
		    word_list.each do |word|
		      result.word_counts[word]+=1
		    end
		    result.word_counts = result.word_counts.sort_by{|word,num| word.downcase}
		    result.word_counts = result.word_counts.sort_by {|word,num| [-num,word]}
	    result
    	end
	end
end