require './B_27_Radostin_Angelov/word_counter.rb'

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
