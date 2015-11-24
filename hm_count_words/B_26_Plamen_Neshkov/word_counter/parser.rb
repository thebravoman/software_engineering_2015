module WordCounter
  class Parser
    def parse(text)
      word_pattern = /\b[A-Za-z0-9]+\b/i
      punctuation_pattern = /[\p{P}\p{S}]/

      words = {}
      punctuation_marks = 0

      text.each_line do |line|
        line.downcase.scan(word_pattern).each do |word|
          if words.key?(word)
            words[word] += 1
          else
            words[word] = 1
          end
        end

        line.downcase.scan(punctuation_pattern)
          .each { punctuation_marks += 1 }
      end

      words = words.sort_by { |word, occur| [-occur, word] }

      Result.new(words, punctuation_marks)
    end
  end
end
