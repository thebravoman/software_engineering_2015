require_relative 'parser.rb'

module WordCounter
  class FileParser < Parser
    def parse(file_path)
      words = Hash.new(0)
      total_marks_count = 0
      File.open(file_path, "r") do |f|
        f.each_line do |line|
          res = super(line)
          words = words.merge(res.word_counts.to_h)
          total_marks_count += res.marks_count
        end
      end

      sorted_words = words.sort_by { |word, occurences| [-occurences, word] }
      Result.new(sorted_words, total_marks_count)
    end
  end
end
