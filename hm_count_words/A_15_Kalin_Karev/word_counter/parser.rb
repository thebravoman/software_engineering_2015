require_relative './result'

module WordCounter
	class Parser
		def self.parse(file_in)
			answer=[]
			word_h=Hash.new(0)
			counter=0
			for_search=['.',',','!','?',';',':','%','#','@','(',')','_','=']
			
			for_search.each do |s_search|
				counter=counter+file_in.count(s_search).to_i
			end
			
			words=file_in.split
			words.each do |word|
				if word.gsub!(/\W+/, '') == nil
				
				else 
					word.gsub!(/\W+/, '')
				end
				
				word = word.downcase
				if not word==""
					word_h[word] +=1
				end
			end
			
			word_h=word_h.sort_by{|word,num| word}
			word_h=word_h.sort_by {|word,num| [-num,word]}
			
			word_h.each do |word, frequency|
				answer << [word,frequency.to_s]
			end
			
			if not counter==0
				answer << ["\"marks\"",counter]
			end
			
			out_answer=Result.new(answer, counter)
			return out_answer
	
		end
	end
end
