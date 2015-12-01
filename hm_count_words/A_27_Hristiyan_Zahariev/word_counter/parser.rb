require_relative 'result.rb'

module WordCounter
  class Parser
    def parse(string)
      result = Result.new
      result.marks_count = string.scan(/[^A-Za-z0-9_ \s]/).count
      string = string.gsub(/[^A-Za-z0-9_]/, ' ').downcase
      string = string.split(" ")
      string.each do |word|
        result.word_counts[word] = result.word_counts[word] + 1
      end
      result.word_counts = result.word_counts.sort_by{|word, number| word.downcase}
      result.word_counts = result.word_counts.sort_by{|word, number| [-number,word]}
      result
    end
  end
end
