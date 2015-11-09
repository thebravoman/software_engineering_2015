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


class Result

  attr_accessor :marks_count
  attr_accessor :word_counts
  def initialize
    @marks_count = 0
    @word_counts = Hash.new 0
  end
  def to_csv
    word_counts.each do |word,i|
      puts "#{word},#{i}"
    end
    puts  "\"marks\",#{marks_count}" if marks_count != 0
  end
  def to_json
    require 'json'
    json_output = { marks: marks_count, words: word_counts }
    JSON.pretty_generate(json_output)
  end
  def to_xml
    require 'rexml/document'
    xml_counts = REXML::Document.new("")
    xml_word_counts = xml_counts.add_element('word-counts')
    xml_marks = xml_word_counts.add_element('marks')
    xml_marks.add_text "#{marks_count}"
    xml_words = xml_word_counts.add_element('words')
    word_counts.each do |index, key|
      word = xml_words.add_element('word')
      word.add_attribute( 'count', key)
      word.add_text "#{index}"
    end
    out = ""
    xml_counts.write(out, 1)
    return out
  end
end
file_name = ARGV[0]
format = ARGV[1]
word_counter = WordCounter.new
word_counter = word_counter.parse_file file_name

if format == "json"
  puts word_counter.to_json
elsif format == "xml"
  puts word_counter.to_xml
else
  puts word_counter.to_csv
end
