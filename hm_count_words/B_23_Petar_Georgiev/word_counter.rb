require 'rexml/document'
require 'csv'
require 'json'

class Word_Count
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

  def parse_file(file_path)
    text = File.read(file_path)
    parse text 
  end
end

class Result
  attr_reader :marks_count, :word_counts

  def initialize(word_count, marks_count)
    @marks = marks_count
    @words = word_count
  end

  def to_json
    json_hash = { "marks": @marks, "words": @words }
    JSON.generate(json_hash)
  end

  def to_xml
    file = REXML::Document.new('')
    word_counts = file.add_element('word-counts')
	  marks = word_counts.add_element('marks').text = "#{@marks}"
	  wordz = word_counts.add_element('words')
    @words.each do |a, b|
	    word = wordz.add_element('word', 'count' => "#{b}").text = "#{a}"
    end
    file.to_s
  end
  def to_csv
    csv_file = []
        @words.each do |a, b|
            csv_file << a + ',' + b.to_s
        end
        if @marks != 0
            csv_file << "\"marks\"," + @marks.to_s
        end
  end
end
