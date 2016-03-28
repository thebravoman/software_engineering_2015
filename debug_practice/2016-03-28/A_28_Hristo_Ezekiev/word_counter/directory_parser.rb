require_relative 'parser.rb'

module WordCounter
  class DirectoryParser < FileParser
    def initialize()
      @words = Hash.new(0)
      @total_marks_count = 0
    end

    def traverse(path='.')
      Dir.entries(path).each do |name|
        if name == '.' || name == '..'
          next
        end

        new_path = path + '/' + name
        if File.ftype(new_path) == 'directory'
          traverse(new_path)
        else
          parse(new_path)
        end
      end
    end

    def parse(file_path)
      res = super(file_path)
      @words = @words.merge(res.word_counts.to_h) { |k, ov, nv| ov + nv }
      @total_marks_count += res.marks_count
    end

    def parse_dir(dir_path)
      traverse(dir_path)
      sorted_words = @words.sort_by { |word, occurences| [-occurences, word] }
      Result.new(sorted_words, @total_marks_count)
    end
  end
end

