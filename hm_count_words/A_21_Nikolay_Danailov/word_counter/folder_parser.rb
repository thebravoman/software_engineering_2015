require 'word_counter/file_parser'
require_relative '../db_utils.rb'

module WordCounter
  # Parses files
  class FolderParser < FileParser
    def parse(folder)
      files = Dir.glob("#{folder}/**/*").select { |f| File.file? f }
      result = WordCounter::Result.new

      files.each do |file|
        get_res_from_for_file file
        temp = super file
        save_res_to_db temp, file
        result.word_counts.merge!(temp.word_counts.to_h) { |_, oldval, newval| newval + oldval }
        result.marks_count += temp.marks_count
      end

      result.word_counts = result.word_counts.sort_by { |word, count| [-count, word] }.to_h
      result
    end
  end
end
