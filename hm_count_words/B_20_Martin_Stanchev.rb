require './B_20_Martin_Stanchev/word_counter.rb'

output_format = ARGV[1]

my_file = WordCounter.new
out = my_file.parse(ARGV[0])

if output_format == 'json'
  out.json_format
  
elsif output_format == 'xml'
  out.xml_format

else out.csv_format
end

