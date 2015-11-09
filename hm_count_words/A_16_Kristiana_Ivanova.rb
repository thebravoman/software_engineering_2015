require 'rexml/document'
require 'json'

class Output
    attr_accessor :marks_count
    attr_accessor :frequencies

    def initialize
      @marks_count = 0
      @frequencies = Hash.new(0)
    end

  def to_csv 
    frequencies.each do |item, amount|
      puts item + "," + amount.to_s
    end

    if marks_count != 0
     puts "\"marks\"," + marks_count.to_s
    end
  end

  # -----------------------------------------------------
  def to_xml
    xml_document = REXML::Document.new
    xml_item_counts = xml_document.add_element 'item-counts'
    xml_marks = item_counts.add_element 'marks'
    xml_marks.add_text "#{marks_count}"
    xmls_items = xml_item_counts.add_element 'items' # xml words

    frequencies.each do |item, amount|
      item = xml_items.add_element('item', 'amount' => amount).text = "#{item}" #item = word
    end

    formatter = REXML::Formatters::Pretty.new(2)
    formatter.compact = true
    formatter.write(xml_dosument, $stdout)
    puts
  end

  # ----------------------------------------------------
  def to_json
    json_output = { "marks" => marks_count, "items" => frequencies}
    puts JSON.pretty_generate(json_output)
  end
end

class WordCounter
  def parse(string)
    result = Result.new
    result.marks_count = string.scan(/[,.!?:;"()\[\]]/).count
    items = string.downcase.gsub(/[^a-z'\s-]/, '').split(" ")
    items.each {|item| frequencies[item] += 1} 
    result.frequencies = result.frequencies.sort_by { |item, amount| [-amount, item]}
    result
  end

  def parse_file(filename)
    text = ''

    File.open(filename) do |file|
      file.each_line do |line|
        text += line
      end
    end

    parse_file text
  end
end

command = ARGV[1]
frequencies = WordCounter.new
result = frequencies.parse_file ARGV[0]
if command == "json"
 puts result.to_json
elsif command == "xml"
 puts result.to_xml
else
 puts result.to_csv
end