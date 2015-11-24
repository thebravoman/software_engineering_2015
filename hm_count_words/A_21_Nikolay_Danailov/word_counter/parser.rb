require 'word_counter/result'

module WordCounter
  # counts words in text
  class Parser
    def count_marks(string)
      string.downcase.scan(/[^a-z0-9_ \n]/).count
    end

    def count_words(words)
      res = Hash.new 0

      words.each do |word|
        res[word] += 1
      end

      res
    end

    def sort_counted_words(result_hash)
      result_hash.sort_by { |word, count| [-count, word] }
    end

    def split_words(string)
      # the regex on the next line removes commented text, strings, regex
      # and any other symbol that isn't a word
      removal_regex = /[^a-z0-9_ ]/
      string.downcase.gsub(removal_regex, ' ').split(' ').reject(&:empty?)
    end

    def parse(string)
      result = Result.new
      # the regex on the next line select all marks
      result.marks_count = count_marks string
      words = split_words string
      result.word_counts = count_words words
      result.word_counts = sort_counted_words result.word_counts
      result
    end
  end
end
