require_relative 'word_counter/word_counter.rb'

@input_file = ARGV[0]
@output_format = ARGV[1]

result = WordCounter.parse_website @input_file

if @output_format == 'json'
  puts result.to_json
elsif @output_format == 'xml'
  formatter = REXML::Formatters::Pretty.new(2)
  formatter.compact = true # makes words show up on one line
  formatter.write(result.to_xml, $stdout)
else
  puts result.to_csv
end
