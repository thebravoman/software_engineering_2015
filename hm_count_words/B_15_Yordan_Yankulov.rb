require_relative 'B_15_Yordan_Yankulov/word_counter'

file_name = ARGV[0]
if file_name != "-d"
  format_of_output = ARGV[1]

  input_format = file_name.split('/').first

  if input_format.start_with?('https:') || input_format.start_with?('http:')
    result = WordCounter.parse_webpage(file_name)
  else
    result = WordCounter.parse_file(file_name)
  end

  if format_of_output == 'json'
    result.to_json
  elsif format_of_output == 'xml'
    result.to_xml
  elsif format_of_output == 'svg'
    result.to_svg
  else
    result.to_csv
  end
else
  folder = ARGV[1]
  result = WordCounter.parse_folder(folder)
  puts result.to_csv
end
