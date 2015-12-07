module WordCounter
  class Parser
    def parse(string)
      word_list = Hash.new(0)
      marks = []

      words = string.downcase.scan(/[a-zA-Z0-9]+/)
      marks.push(string.scan(/[[:punct:]|+-=\/\\]/).size)

      words.each { |word| word_list[word] += 1 }
      sorted_list = word_list.sort_by {|key, val| [-val, key] }.to_h

      marks_count = marks.inject(:+)

      Result.new(sorted_list, marks_count)
    end
  end
end
