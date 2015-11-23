module WordCounter
  class Parser
    def parse(string)
      result = Result.new
      result.marks_count = string.scan(/[[:punct:]]/).count
      words = string.downcase.gsub(/[^a-z\s-]/, ' ').split(' ')

      words.each do |word|
        result.word_counts[word] += 1
      end

      result.word_counts = result.word_counts.sort_by { |word, occur| [-occur, word] }
      result
    end



    def parse_file(filename)
      text = ''

      File.open(filename) do |file|
        file.each_line do |line|
          text += line
        end
      end

      parse text
    end
  end
end
