require 'word_counter/file_parser'

module WordCounter
  # Parses files
  class FolderParser < FileParser
    def parse(folder, extension)
      if extension == :cpp || extension == :cc
        files = Dir.glob("#{folder}/**/*.cc").select { |f| File.file? f }
        files += Dir.glob("#{folder}/**/*.cpp").select { |f| File.file? f }
      else
        files = Dir.glob("#{folder}/**/*.#{extension}").select { |f| File.file? f }
      end

      result = WordCounter::Result.new

      current_file = 0
      files.each do |file|
        current_file += 1
        puts "file #{current_file} of #{files.size} (#{((current_file.to_f / files.size) * 100).round(2)}%) for #{extension} - #{file}"# if current_file % 10 == 0
        temp = super file, extension
        result.word_counts.merge!(temp.word_counts.to_h) { |_, oldval, newval| newval + oldval }
        result.marks_count += temp.marks_count
      end

      result.word_counts = result.word_counts.sort_by { |word, count| [-count, word] }.to_h
      result
    end

  end
end
