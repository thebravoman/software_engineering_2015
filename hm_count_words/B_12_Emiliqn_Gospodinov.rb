require '/home/decisioner/Desktop/software_engineering_2015/hm_count_words/B_12_Emiliqn_Gospodinov/Result.rb' #Here must be the whole path
require '/home/decisioner/Desktop/software_engineering_2015/hm_count_words/B_12_Emiliqn_Gospodinov/WordCounter.rb'
format = ARGV[1]

word_counter = WordCounter.new
result = word_counter.parse_file ARGV[0]

if format == "json"
  puts result.to_json
elsif format == "xml"
  puts result.to_xml
elsif format == "csv" or format == nil
  puts result.to_csv
end
