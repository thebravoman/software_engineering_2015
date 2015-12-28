#!/usr/bin/ruby
require_relative 'B_03_Bojidar_Valchovski/word_counter.rb'

if ARGV[0] == "-d"
  path = ARGV[1]
  result = WordCounter::parse_folder(path)
  puts result.to_csv
  $res = ''
  def parse(path)
    Dir.glob(path+"**/"+"*").each do |file|
      if File.file? file         
        $res << File.read(file)
      end
    end
  end
  parse(path)
  string = $res
  marks = 0	
  words = Hash.new
  string.scan(/[\p{P}\p{S}]/).each { marks += 1 }
  string = string.gsub(/[^A-Za-z0-9]/, ' ').downcase
  string = string.gsub("-", ' ')
  string = string.split(" ")

  string.each do |word|
    if words[word]
	  words[word] += 1
    else
	  words[word] = 1
	end
  end

  words = words.sort_by{|word,occ| word.downcase}	
  words = words.sort_by{|word,occ| [-occ,word]}

  words.to_csv
else
  path = ARGV[0]
  format = ARGV[1]

  is_url = path.start_with?("http://") || path.start_with?("https://")

  if is_url
    result = WordCounter::parse_web path
  else
    result = WordCounter::parse_file path
  end

  if format == "xml" 
    puts result.to_xml
  elsif format == "json"
    puts result.to_json
  else
    puts result.to_csv
  end

  result.to_svg

end
