require_relative 'B_09_Georgi_Stoilov/word_counter.rb'

option = ARGV[0]
if(option != '-d')
  file = ARGV[0]
  format = ARGV[1]
else
  file = ARGV[1]
  format = ARGV[2]
end

if(File.exist?('result_Georgi_Stoilov.csv'))
  WordCounter.delete_file('result_Georgi_Stoilov.csv')
elsif(File.exist?('result_Georgi_Stoilov.json'))
  WordCounter.delete_file('result_Georgi_Stoilov.json')
elsif(File.exist?('result_Georgi_Stoilov.xml'))
  WordCounter.delete_file('result_Georgi_Stoilov.xml')
end

if(File.exist?('B_09_Georgi_Stoilov.db'))
  WordCounter.delete_file('B_09_Georgi_Stoilov.db')
end

flag = 0
if(option == '-d')
  flag = 1
  result = WordCounter.parse_folder file,format
  WordCounter.make_database 'result_Georgi_Stoilov.csv', format, file

else
  #if(file.include?("http://") || file.include?("https://")) it can be break so....
  if(file.start_with?('https://') || file.start_with?('http://'))
    result = WordCounter.parsing_web_source file
  elsif(file.include?(" "))
      result = WordCounter.parse file
  else
      result = WordCounter.parsing_the_file file
  end
end

if(flag == 0)
  if format == 'csv' || format == nil
    result.to_csv
    WordCounter.make_database 'result_Georgi_Stoilov.csv', format, file
    else
    if format == 'json'
      result.to_json
      else
      if format == 'xml'
        result.to_xml
      end
    end
  end
end

if(File.exist?('result_Georgi_Stoilov.csv'))
  WordCounter.delete_file('result_Georgi_Stoilov.csv')
elsif(File.exist?('result_Georgi_Stoilov.json'))
  WordCounter.delete_file('result_Georgi_Stoilov.json')
elsif(File.exist?('result_Georgi_Stoilov.xml'))
  WordCounter.delete_file('result_Georgi_Stoilov.xml')
end
