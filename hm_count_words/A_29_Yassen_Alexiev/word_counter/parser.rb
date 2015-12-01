require 'word_counter/result'

module WordCounter
  class Parser
    def count_marks(string)
      string.downcase.scan(/[^a-z0-9_ \n]/).count
    end

    def count_words(words)
      result = Hash.new 0

      words.each do |word|
        result[word] += 1
      end

      result
    end

    def sort_counted_words(result_hash)
      result_hash.sort_by { |word, count| [-count, word] }.to_h
    end

    def split_words(string)
      rm_regex = /[^a-z0-9_ ]/
      string.downcase.gsub(rm_regex, ' ').split(' ').reject(&:empty?)
    end

    def parse(string)
      result = Result.new
      result.marks_count = count_marks string
      words = split_words string
      result.word_counts = count_words words
      result.word_counts = sort_counted_words result.word_counts
      result
    end
  end
end