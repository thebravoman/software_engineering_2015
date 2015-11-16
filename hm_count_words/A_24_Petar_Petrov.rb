require 'json'
require 'rexml/document'
require './A_24_Petar_Petrov/result.rb'
require './A_24_Petar_Petrov/word_counter.rb'

result = WordCounter.new.parse_file(ARGV[0])

if ARGV[1] == 'json'
  result.to_json
elsif ARGV[1] == 'xml'
  result.to_xml
else
  result.to_csv
end
