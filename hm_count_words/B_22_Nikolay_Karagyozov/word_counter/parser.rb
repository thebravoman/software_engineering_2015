module WordCounter
  require 'digest'

  class Parser
    def parse(string)
      word_list = Hash.new(0)
      marks = []

      words = string.downcase.scan(/\b[A-Za-z0-9]+\b/i)
      marks.push(string.scan(/[\p{P}\p{S}]/).size)

      words.each { |word| word_list[word] += 1 }
      sorted_list = word_list.sort_by {|key, val| [-val, key] }.to_h

      marks_count = marks.inject(:+)

      digest = Digest::SHA256.digest(string)
      Result.new(sorted_list, marks_count, digest)
    end
  end
end
