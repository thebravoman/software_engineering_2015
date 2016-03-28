require_relative 'result'

module WordCounter
  class Parser
    def parse(string)
      words = Hash.new()
      total_marks_count = 0
      current_string_words = string.downcase.gsub(/[^a-z0-9_ ]/, ' ').split(" ").reject(&:empty?)
      current_string_words.each do |word|
		if(words[word]) 
		 words[word] += 1
		else 
		 words[word] = 1
		end
      end

      total_marks_count = string.scan(/[[:punct:]=`~$^+|<>]/).count
      sorted_words = words.sort_by { |word, occurences| [-occurences, word] }
      Result.new(sorted_words, total_marks_count)
    end
  end
end
