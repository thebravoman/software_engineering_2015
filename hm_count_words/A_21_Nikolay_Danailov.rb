require 'json'
require 'rexml/document'
require './A_21_Nikolay_Danailov/result'
require './A_21_Nikolay_Danailov/word_counter'

@input_file = ARGV[0]
@output_format = ARGV[1]

word_counter = WordCounter.new
result = word_counter.parse_file @input_file

if @output_format == 'json'
  puts result.to_json
elsif @output_format == 'xml'
  formatter = REXML::Formatters::Pretty.new(2)
  formatter.compact = true # makes words show up on one line
  formatter.write(result.to_xml, $stdout)
else
  puts result.to_csv
end
