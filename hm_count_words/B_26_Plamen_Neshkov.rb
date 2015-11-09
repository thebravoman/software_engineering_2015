require 'csv'
require 'json'
require 'rexml/document'

class WordCounter
  def parse(text)
    word_pattern = /\b[\w-]+\b/i
    punctuation_pattern = /\p{P}/

    words = {}
    punctuation_marks = 0

    text.each_line do |line|
      line.downcase.scan(word_pattern).each do |word|
        if words.key?(word)
          words[word] += 1
        else
          words[word] = 1
        end
      end

      line.downcase.scan(punctuation_pattern)
        .each { punctuation_marks += 1 }
    end

    words = words.sort_by { |word, occur| [-occur, word] }

    Result.new(words, punctuation_marks)
  end

  def parse_file(filepath)
    text = File.read(filepath)
    parse(text)
  end
end

class Result
  attr_reader :marks_count, :word_counts

  def initialize(word_counts, marks_count)
    @marks_count = marks_count
    @word_counts = word_counts
  end

  def to_csv
    CSV.generate do |csv|
      @word_counts.each do |word, occur|
        csv << [word, occur]
      end
      csv << ["'marks'", @marks_count] unless @marks_count == 0
    end
  end

  def to_json
    json_hash = { "marks": @marks_count, "words": @word_counts }
    JSON.generate(json_hash)
  end

  def to_xml
    document = REXML::Document.new
    word_counts = document.add_element('word-counts')
    word_counts.add_element('marks').add_text(@marks_count.to_s)
    words_element = word_counts.add_element('words')
    @word_counts.each do |word, occur|
      words_element.add_element('word')
        .add_text(word)
        .add_attribute('count', occur.to_s)
    end

    document.to_s
  end
end
