# Processes and extracts words from text
class WordCounter
  private

  def parse(string)
    result = Result.new
    result.marks_count = string.scan(/[[,.!?:;"()\[\]]]/).count
    words = string.downcase.gsub(/['"].+['"]|[^A-Za-z_]/, ' ').split(' ').reject(&:empty?)

    words.each do |word|
      result.word_counts[word] += 1
    end

    result.word_counts = result.word_counts.sort_by { |word, count| [-count, word] }
    result
  end

  public

  def parse_file(filename)
    text = ''

    File.open(filename) do |file|
      file.each_line do |line|
        text += line
      end
    end

    parse text
  end
end
