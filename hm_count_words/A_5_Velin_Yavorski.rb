require 'word_counter'

input = ARGV[0]
input2 = ARGV[1]

def dir_process input
  str_parse = ""
  Dir["#{input}/**/*.*"].each do |f|
    if !(f.include? "~")		
      File.readlines(f).each do |line|
        str_parse << line.to_s
      end
    end
  end
  str_parse
end

if(input.start_with?('http://') || input.start_with?('https://'))
  result = WordCounter.parse_webpage(input)
elsif File.file? input
  result = WordCounter.parse_file(input)
elsif input == "-d"
  result = WordCounter.parse (dir_process input2)
else
  result = WordCounter.parse input
end

if(input2 == "json")
  puts result.to_json
elsif(input2 == "xml")
  puts result.to_xml
else
  result.to_csv
end
result.make_svg
