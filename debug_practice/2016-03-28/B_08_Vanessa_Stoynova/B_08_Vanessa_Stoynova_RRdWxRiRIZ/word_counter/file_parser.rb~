require_relative 'parser'
require_relative 'data'
require 'digest'

module WordCounter
  class FileParser < Parser
    def parse(file_path)
      words = Hash.new(0)
      total_marks_count = 0
      File.open(file_path, "r") do |f|
        f.each_line do |line|
          res = super(line)
          words = words.merge(res.word_counts.to_h) { |k, ov, nv| ov + nv }
          total_marks_count += res.marks_count
        end
      end
      sorted_words = words.sort_by { |word, occurences| [-occurences, word] }
      file_hash = Digest::SHA256.file(file_path).hexdigest
      result = Result.new(sorted_words, total_marks_count)
      Data.save(file_path, file_hash, result)
      return result
    end
  end
end
