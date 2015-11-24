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
    csv = []

    word_counts.each do |word, count|
      csv << word + ',' + count.to_s
    end

    csv << "\"marks\"," + marks_count.to_s if marks_count > 0
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
