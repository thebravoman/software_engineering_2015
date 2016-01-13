module WordCounter
  require 'digest'

  class Parser
    def parse(string)
      result = LocalData::get_cached_data(string)
      return result if !result.nil?

      word_list = Hash.new(0)
      marks = []

      words = string.downcase.scan(/\b[A-Za-z0-9]+\b/i)
      marks.push(string.scan(/[\p{P}\p{S}]/).size)

      words.each { |word| word_list[word] += 1 }
      sorted_list = word_list.sort_by {|key, val| [-val, key] }.to_h

      marks_count = marks.inject(:+)

      end_result = Result.new(sorted_list, marks_count)
      LocalData::save(end_result)

      return end_result
    end
  end
end
