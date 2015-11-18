# Processes and extracts words from text
class WordCounter
  private

  def parse(string)
    result = Result.new
    # the regex on the next line select all marks
    result.marks_count = string.scan(/[^A-Za-z_0-9 ]/).count
    # the regex on the next line removes commented text, strings, regex and any other symbol that isn't a word
    removal_regex = %r{(/.+/)|(['"].+['"])|[^A-Za-z_ ]}
    words = string.downcase.gsub(removal_regex, ' ').split(' ').reject(&:empty?)

    words.each do |word|
      result.word_counts[word] += 1
    end

    result.word_counts = result.word_counts.sort_by { |word, count| [-count, word] }
    result
  end

  public

  def parse_file(filename)
    parse File.read(filename).encode('UTF-8', 'UTF-8', invalid: :replace)
  end
end
