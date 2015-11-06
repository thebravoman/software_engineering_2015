require 'json'
require 'rexml/document'

@input_file = ARGV[0]
@output_format = ARGV[1]

# Processes and extracts words from text
class WordCounter
  private

  def parse(string)
    result = Result.new
    result.marks_count = string.scan(/[,.!?:;"()\[\]]/).count
    words = string.downcase.gsub(/[^a-z'\s-]/, '').split(' ')

    words.each do |word|
      result.word_counts[word] += 1
    end

    result.word_counts = result.word_counts.sort_by { |word, _count| word }
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

# Represents the result of counting words
class Result
  private

  def add_words_to_xml(xml_doc)
    words = xml_doc.elements['word-counts/words']

    word_counts.each do |word, count|
      word_element = words.add_element 'word'
      word_element.add_attribute 'count', count
      word_element.add_text "#{word}"
    end
  end

  public

  attr_accessor :marks_count
  attr_accessor :word_counts

  def initialize
    @marks_count = 0
    @word_counts = Hash.new 0
  end

  def to_csv
    word_counts.each { |word, count| puts word + ',' + count.to_s }
    "\"marks\"," + marks_count.to_s
  end

  def to_json
    json_output = { marks: marks_count, words: word_counts }
    JSON.pretty_generate(json_output)
  end

  def to_xml
    document = REXML::Document.new
    word_counts_element = document.add_element 'word-counts'
    word_counts_element.add_element('marks').add_text "#{marks_count}"
    word_counts_element.add_element 'words'
    add_words_to_xml document
    document
  end
end

word_counter = WordCounter.new
result = word_counter.parse_file @input_file

if @output_format == 'json'
  puts result.to_json
elsif @output_format == 'xml'
  formatter = REXML::Formatters::Pretty.new(2)
  formatter.compact = true # makes words show up on one line
  formatter.write(result.to_xml, $stdout)
else
  puts result.to_csv
end
