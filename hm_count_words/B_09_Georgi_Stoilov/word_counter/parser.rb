require_relative 'result'

module WordCounter

  class Parser
  
   def parse_string (string)
    result = Result.new
    result.marks = string.scan(/[\p{P}\p{S}]/u).count
    string = string.downcase.split
    string.each do |word|
      word = word.gsub(/[\W+_\d+]/, ' ')
      if(word.include?(" "))
        word = word.split(" ")
        word.each do |b|
          result.word_counter[b]= 1
        end
        else if !word.empty?
          result.word_counter[word] += 1
        end
      end
    end
    result.word_counter = result.word_counter.sort_by { |key, value| [-value, key] }
    result
   end
   
  end
  
end
