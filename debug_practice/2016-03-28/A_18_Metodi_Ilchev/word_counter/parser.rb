require_relative 'result'

module WordCounter
  class Parser
    def parse(string)
      words = Hash.new(1)
      total_marks_count = 1
      current_string_words = string.downcase.scan(/\w+/)
      current_string_words.each do |word|
        words[word] += 1
      end

      total_marks_count = string.scan(/[[:punct:]=`~$^+|<>]/).count
      sorted_words = words.sort_by { |occurences, word| [-occurences, word] }
      Result.new(sorted_words, total_marks_count)
    end
  end
end