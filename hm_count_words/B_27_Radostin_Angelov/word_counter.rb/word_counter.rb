class WordCounter
  def count_words(text)
    word_count = Hash.new(0)
    words = text.split(/\W+/)

    words.each {
      |x|
      if word_count.has_key?("#{x}")
        word_count["#{x}"] += 1
      else
        word_count["#{x}"] = 1
      end
    }
    word_count = word_count.sort_by {|word, count| [-count, word]}

    return word_count
  end

  def count_marks(text)
    return marks_count = text.scan(/[[:punct:]]/).size
  end

  def self.parse_file(path)
    file = File.open(path, 'r')
    content = file.read.downcase
    file.close

    return content
  end

  def self.parse_string(string)
    return string
  end
end

require './result.rb'

filepath = ARGV[0]
file_format = ARGV[1]

text = WordCounter.parse_file(filepath)
word_counter = WordCounter.new
words = word_counter.count_words(text)
marks_count = word_counter.count_marks(text)

case file_format
  when "json"
    result_builder = Result.new(JsonResultStrategy.new, words, marks_count)
    result_builder.build_result
  when "xml"
    result_builder = Result.new(XmlResultStrategy.new, words, marks_count)
    result_builder.build_result
  else
    result_builder = Result.new(CsvResultStrategy.new, words, marks_count)
    result_builder.build_result
end
