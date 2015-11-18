require './result'

# TODO: Extract the repeating code into a method
class WordCounter
  def parse(string)
    words = Hash.new(0)
    total_marks_count = 0
    current_string_words = string.downcase.scan(/\w+/)
    current_string_words.each do |word|
      words[word] += 1
    end

    total_marks_count += string.scan(/[[:punct:]]/).count
    sorted_words = words.sort_by { |word, occurences| [-occurences, word] }
    Result.new(sorted_words, total_marks_count)
  end

  def parse_file(file_path)
    words = Hash.new(0)
    total_marks_count = 0
    File.open(file_path, "r") do |f|
      f.each_line do |line|
        current_line_words = line.downcase.scan(/\w+/)
        current_line_words.each do |word|
          words[word] += 1
        end
        total_marks_count += line.scan(/[[:punct:]]/).count
      end
    end

    sorted_words = words.sort_by { |word, occurences| [-occurences, word] }
    Result.new(sorted_words, total_marks_count)
  end
end
