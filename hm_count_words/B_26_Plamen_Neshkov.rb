require 'csv'
require 'json'
require 'rexml/document'

def scan_file
  word_pattern = /\b[\w-]+\b/i
  punctuation_pattern = /\p{P}/

  words = {}
  punctuation_marks = 0

  File.open(ARGV[0], 'r') do |text|
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
  end

  [words, punctuation_marks]
end

def write_csv(sorted_words, punctuation_marks)
  CSV.open('result.csv', 'w') do |csv|
    sorted_words.each do |word, occur|
      csv << [word, occur]
    end
    csv << ["'marks'", punctuation_marks] unless punctuation_marks == 0
  end
end

def write_json(sorted_words, punctuation_marks)
  File.open('result.json', 'w') do |json|
    json_hash = { "marks": punctuation_marks, "words": sorted_words }
    json.write JSON.generate(json_hash)
  end
end

def write_xml(sorted_words, punctuation_marks)
  File.open('result.xml', 'w') do |xml|
    document = REXML::Document.new
    word_counts = document.add_element('word-counts')
    word_counts.add_element('marks').add_text(punctuation_marks.to_s)
    words_element = word_counts.add_element('words')
    sorted_words.each do |word, occur|
      words_element.add_element('word')
        .add_text(word)
        .add_attribute('count', occur.to_s)
    end

    xml << document.to_s
  end
end

results = scan_file
words = results[0]
punctuation_marks = results[1]

sorted_words = words.sort_by { |word, occur| [-occur, word] }

if ARGV[1]
  format = ARGV[1]
else
  format = 'csv'
end

if format == 'csv'
  write_csv(sorted_words, punctuation_marks)
elsif format == 'json'
  write_json(sorted_words, punctuation_marks)
elsif format == 'xml'
  write_xml(sorted_words, punctuation_marks)
end
