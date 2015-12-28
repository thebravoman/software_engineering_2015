require_relative 'result.rb'

module WordCounter
  class Parser
    def parse(string)
      result = Result.new
      result.marks_count = string.count(".,=[]()'!{}?:_;\"")
      string = string.gsub(/[^A-Za-z_0-9\s]/, ' ').downcase
      word_list = string.split(' ')
      word_list.each do |word|
        result.word_counts[word] += 1
      end
      result.word_counts = result.word_counts.sort_by{|word,num| word.downcase}
      result.word_counts = result.word_counts.sort_by {|word,num| [-num,word]}
      result
    end
  end
end

=begin

     words.each do |word|
        res[word] += 1
      end

      res
    end

    def sort_counted_words(result_hash)
      result_hash.sort_by { |word, count| [-count, word] }.to_h
    end

    def split_words(string)
      removal_regex = /[^a-z0-9_ ]/
      string.downcase.gsub(removal_regex, ' ').split(' ').reject(&:empty?)
    end

=end
