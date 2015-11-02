#text = "" 
require 'csv'
require 'rexml/document'
require 'json'


@input_file = ARGV[0]
@output_format = ARGV[1]

def output_csv frequencies, marks_count
	frequencies.each {item, amount| puts item + "," + amount.to_s}
	puts "\"marks\"," + marks_count.to_s
end

def output_xml frequencies, marks_count
  document = REXML::Document.new
  item_counts = document.add_element 'item-counts'
  marks = item_counts.add_element 'marks'
  marks.add_text "#{marks_count}"
  items = item_counts.add_element 'items'

  frequencies.each do |item, amount|
    item_element = items.add_element 'item'
    item_element.add_attribute 'amount', amount
    item_element.add_text item
  end

def output_json frequencies, marks_count
  json_output = { :marks => marks_count, :words => frequencies
   }
  puts JSON.pretty_generate(json_output)
end

 out = ""
  document.write(out, 1)
  puts out
end

File.open(@input_file) do |file|
  text = " "

  file.each_line do |line|
    text += line
  end

  marks_count = text.scan(/[,.!?:;"()\[\]]/).count
  items = text.downcase.gsub(/[^a-z'\s-]/, '').split(" ")

  frequencies = Hash.new(0)

  items.each do |item|
    frequencies[item] += 1
  end

  frequencies = frequencies.sort_by { |item, amount| [-amount, item] }

  if @output_format == "xml"
    output_xml frequencies, marks_coun
  elsif @output_format == "json"
    output_json frequencies, marks_count
  else
    output_csv frequencies, marks_count
  end
end
=begin
marks = text.scan(/[,.!?:;"()\[\]]/).count 
words = text.downcase.gsub(/[^a-z\n ]/, '').split(" ") 

frequencies = Hash.new(0)

words.each {|item| frequencies[item] += 1}

frequencies = frequencies.sort_by {|item, amount| [-amount, item]} #item.length
#frequencies.reverse!
frequencies.each do |item, amount|
	puts item + "," + amount.to_s
end

if marks > 0
	puts "\"marks\",#{marks}"
end
=end
