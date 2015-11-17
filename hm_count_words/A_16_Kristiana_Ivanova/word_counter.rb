class WordCounter

  def parse(string)
    result = Result.new
    result.marks_count = string.scan(/[,.!?:;"()\[\]]/).count
    items = string.downcase.gsub(/['"].+['"]|[^A-Za-z_]/, ' ').split(' ').reject(&:empty?)

    items.each {|item| result.word_counts[item] += 1} 
    result.word_counts = result.word_counts.sort_by { |item, amount| [-amount, item]}
    result
  end

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
