require 'csv'
require 'json'
require 'rexml/document'

word_list = Hash.new(0)
marks = []

def export_csv(words, total_marks)
  CSV.open("result.csv","w") do |csv|
    words.each { |key, val| csv << [key, val] }
    csv << ["marks", total_marks] if total_marks > 0
  end
end

def export_json(words, total_marks)
  File.open("result.json", "w") do |file|
    word_format = []
    words.each { |k, v| word_format.push([k, v]) }
    json_format = {
      "marks" => total_marks,
      "words" => word_format
    }

    file << JSON.pretty_generate(json_format)
  end
end

def export_xml(words, total_marks)
 xml = REXML::Document.new

 words_counts = xml.add_element("word-counts")
 words_counts.add_element("marks").add_text("#{total_marks}")
 words_xml = words_counts.add_element("words")

 words.each do |key, val|
   word = words_xml.add_element("word")
   word.add_attribute("count", val)
   word.add_text("#{key}")
 end

 output = ''
 xml.write(output, 1)

 File.open("result.xml", "w") { |file| file << output }
end

file = File.new(ARGV[0], "r")
while line = file.gets
  words = line.downcase.scan(/\w+/)
  marks.push(line.scan(/[[:punct:]]/).size)

  words.each { |word| word_list[word] += 1 }
end
file.close

sorted_list = word_list.sort_by {|key, val| [-val, key] }.to_h
sorted_list.each { |key, val| puts "#{key},#{val}" }

marks_count = marks.inject(:+)
puts "\"marks\",#{marks_count}" if marks_count > 0

format_choice = ARGV[1]

if (format_choice == "xml")
  export_xml(sorted_list, marks_count)
elsif (format_choice == "json")
  export_json(sorted_list, marks_count)
else
  export_csv(sorted_list, marks_count)
end
