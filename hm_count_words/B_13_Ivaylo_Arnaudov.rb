require 'json'
require 'rexml/document'
require 'stringio'

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

class Result
  attr_reader :word_counts, :marks_count

  def initialize(word_counts, marks_count)
    @word_counts = word_counts
    @marks_count = marks_count
  end

  def to_csv
    result = StringIO.new
    word_counts.each do |word, occurences|
      result << "#{word},#{occurences}\n"
    end

    if marks_count > 0
      result << "\"marks\",#{marks_count}\n"
    end

    result.string
  end

  def to_json
    hash_format = {
      "marks" => marks_count,
      "words" => word_counts
    }

    JSON.pretty_generate(hash_format)
  end

  def to_xml
    doc = REXML::Document.new
    doc.context[:attribute_quote] = :quote
    word_counts_element = doc.add_element('word-counts')

    marks_element = word_counts_element.add_element('marks')
    marks_element.add_text(marks_count.to_s)

    words_element = word_counts_element.add_element('words')

    word_counts.each do |word, count|
      word_element = words_element.add_element('word')
      word_element.add_attributes({"count" => count.to_s })
      word_element.add_text(word)
    end

    formatter = REXML::Formatters::Pretty.new(4)
    formatter.compact = true
    res = ''
    formatter.write(doc, res)
    res
  end
end

file_path = ARGV[0]
format = ARGV[1] == nil ? 'csv' : ARGV[1].downcase

word_counter = WordCounter.new
result = word_counter.parse_file(file_path)

case format
when 'json'
  puts result.to_json
when 'xml'
  puts result.to_xml
else
  puts result.to_csv
end
