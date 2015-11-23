module word_Count
 class Parser
  def parse(text)
    words_check = /\b[A-Za-z0-9-]+\b/i
    marks_check = /[\p{P}_]/

    words = {}
    marks = 0

    text.each_line do |line|
      file_words = line.downcase.scan(words_check)
      file_words.each do |word|
        if words.key?(word)
          words[word] += 1
        else
          words[word] = 1
        end
      end
    end
    text.each_line do |line|
      file_marks = line.downcase.scan(marks_check)
      file_marks.each { marks += 1 }
    end

    words = words.sort_by { |a, b| [-b, a] }

    Result.new(words, marks)
  end
 end
end
