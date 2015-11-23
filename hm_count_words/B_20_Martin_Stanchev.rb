require './B_20_Martin_Stanchev/word_counter.rb'

input_format = ARGV[0]
output_format = ARGV[1]

out = WordCounter::parse(input_format)

if output_format == 'json'
  out.json_format
  
elsif output_format == 'xml'
  out.xml_format

else out.csv_format
end

