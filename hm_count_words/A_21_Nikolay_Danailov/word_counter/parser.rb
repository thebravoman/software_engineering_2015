require 'word_counter/result'

module WordCounter
  class Parser
    def self.parse(text)
      result = Result.new
      # the regex on the next line select all marks
      result.marks_count = text.downcase.scan(/[^a-z0-9_ \n]/).count
      # the regex on the next line removes commented text, strings, regex and any other symbol that isn't a word
      removal_regex = %r{[^a-z0-9_ ]}
      words = text.downcase.gsub(removal_regex, ' ').split(' ').reject(&:empty?)

      words.each do |word|
        result.word_counts[word] += 1
      end

      result.word_counts = result.word_counts.sort_by { |word, count| [-count, word] }
      result
    end
  end
end