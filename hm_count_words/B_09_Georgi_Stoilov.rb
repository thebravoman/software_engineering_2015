require './B_09_Georgi_Stoilov/word_counter'

file = ARGV[0]
format = ARGV[1]

counter = WordCounter.new
result = counter.parse_file file

if format == 'csv' || format == nil
  result.to_csv
  else
  if format == 'json'
    result.to_json
    else
    if format == 'xml'
      result.to_xml
    end
  end
end
