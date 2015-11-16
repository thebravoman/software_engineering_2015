class ResultStrategy
  def build_result(words_hash, marks_count)
    raise NotImplementedError, "This class is supposed to be inherited!"
  end
end

class JsonResultStrategy < ResultStrategy
  require 'json'

  def build_result(words_hash, marks_count)
    result_json = { :words => words_hash, :marks => "#{marks_count}".to_i}
    result_json = JSON.pretty_generate(result_json)
    puts result_json
    File.open("result.json", "w") do |file|
      file << result_json
    end
  end
end

class CsvResultStrategy < ResultStrategy
  require 'csv'

  def build_result(words_hash, marks_count)
    CSV.open("result.csv", "w") do |csv|
      words_hash.each do |word, count|
        puts "#{word},#{count}"
        csv << [word, count]
      end
      puts "\"marks\",#{marks_count}"
      csv << ["\"marks\"", marks_count]
    end
  end
end

class XmlResultStrategy
  require 'rexml/document'

  def build_result(words_hash, marks_count)
    xml_document = REXML::Document.new("")

    xml_word_counts = xml_document.add_element('word-counts')

    xml_marks = xml_word_counts.add_element('marks')
    xml_marks.add_text "#{marks_count}"

    xml_words = xml_word_counts.add_element('words')
    words_hash.each do |word, count|
      xml_word = xml_words.add_element('word')
      xml_word.add_attribute('count', count)
      xml_word.add_text "#{word}"
    end

    xml_result = ""
    xml_document.write(xml_result, 1)
    puts xml_result
    File.open("result.xml", "w") do |file|
      file << xml_result
    end
  end
end

class Result
  def initialize(result_build_strategy ,words_hash, marks_count)
    @result_build_strategy = result_build_strategy
    @words = words_hash
    @marks_count = marks_count
  end

  def build_result
    @result_build_strategy.build_result(@words, @marks_count)
  end
end