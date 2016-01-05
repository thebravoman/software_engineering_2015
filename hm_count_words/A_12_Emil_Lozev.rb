require_relative './A_12_Emil_Lozev/word_counter'

def fileOrSite(filename)
	first = filename.split('/').first
	return first == 'http:' || first == 'https:'
end

def printRes(filename,option)
  if File.file? filename
    result = WordCounter.parse_file filename
  elsif fileOrSite filename
    result = WordCounter.parse_webpage filename
  else
    result = Parser.parse filename
  end
  print(result,option)
end

def print(result,option)
  if option == 'csv'
    result.to_csv
  elsif option == 'json'
    puts result.to_json
  elsif option == 'xml'
  require 'builder'
    puts result.to_xml
  elsif option == 'svg'
  	#result.to_svg
  else
    result.to_csv
  end

  result.to_svg
end 

def filepathparser(filepath,format)
  files = Dir.glob("#{filepath}/**/*").select { |f| File.file? f }
  merged_files = []

  files.each do |file|
    con = File.open(file).read
    con.each_line do |line|
    	merged_files << line
	end
  end

  File.open("../filе.txt","w") do |f|
    merged_files.each do |line|
      f << line 
    end
  end

  printRes("../filе.txt",format)
  File.delete("../filе.txt")
end

if ARGV[0] == '-d'
  filepath = ARGV[1]
  format = ARGV[2]
  filepathparser(filepath,format)
else
  filename = ARGV[0]
  option = ARGV[1]
  printRes(filename,option)
end
