require 'json'
require 'rexml/document'
<<<<<<< HEAD:hm_count_words/A_24_Petar_Petrov.rb~
require './A_24_Petar_Petrov/word_counter/result.rb'
require './A_24_Petar_Petrov/word_counter.rb'

result = WordCounter.parse_file(ARGV[0])
=======
require 'word_counter'

start = ARGV[0].split('/').first
if start == 'http:' || start == 'https:'
  result = WordCounter.parse_website(ARGV[0])
else
  result = WordCounter.parse_file(ARGV[0])
end
>>>>>>> 6deab35782f503bfa65afbca8303a7bc7c570690:hm_count_words/A_24_Petar_Petrov.rb

if ARGV[1] == 'json'
  result.to_json
elsif ARGV[1] == 'xml'
  result.to_xml
else
  result.to_csv
end
