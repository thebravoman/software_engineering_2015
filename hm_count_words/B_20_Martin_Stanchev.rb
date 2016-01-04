require_relative 'B_20_Martin_Stanchev/word_counter.rb'

input = ARGV[0]
output_format = ARGV[1]

input_format = input.split('/').first


if input_format == 'http:' || input_format == 'https:'
  out = WordCounter.parse_webpage(input)

elsif input == '-d'
  out = WordCounter.parse_directory(output_format)

else
  out = WordCounter.parse_file(input)

end

if output_format == 'json'
  out.json_format

elsif output_format == 'xml'
  out.xml_format

elsif input == '-d'
  out.json_format

else out.csv_format
end

WordCounter::SVGGenerator::create_graph(out.str)
