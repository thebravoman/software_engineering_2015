module WordCounter
  require 'json'
  require 'rexml/document'
  require 'stringio'

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
end
