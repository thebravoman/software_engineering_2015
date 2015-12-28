require_relative 'A_27_Hristiyan_Zahariev/word_counter.rb'
require 'csv'
require 'json'
require 'rexml/document'
require 'fileutils'

input_filename = ARGV[0]
output_option = ARGV[1]

def FileOrSite?(filename)
  protocol = filename.split('/').first
  return protocol == 'http:' || protocol == "https:"
end

def WhatToCall? (input_filename, output_option)
  if File.file? input_filename
    result = WordCounter.parse_file input_filename
  elsif FileOrSite? input_filename
    result = WordCounter.parse_webpage input_filename
  else
    result = Parser.parse input_filename
  end
  printing(result, output_option)
end

def printing (result, output_option)
  if output_option == 'csv'
    result.to_csv
  elsif output_option == 'json'
    result.to_json
  elsif output_option == 'xml'
    result.to_xml
  else
    result.to_csv
  end
  result.to_svg
end

def PathParser (input_filename, output_option)
  files = Dir.glob("#{input_filename}/**/*").select { |f| File.file? f }
  combined_files = []

  files.each do |file|
    con = File.read(file)
    combined_files << con
  end
  Dir.mkdir("SomeFolder")  unless Dir.exist?("SomeFolder") #Trying something stupid
  File.open("SomeFolder/combined.txt","w") do |file| 
    combined_files.each do |line|
      file << line 
    end
  end
  WhatToCall?("SomeFolder/combined.txt",output_option)
  FileUtils.remove_dir("SomeFolder")
end

if ARGV[0] == '-d'
  input_filename = ARGV[1]
  output_option = ARGV[2]
  PathParser(input_filename, output_option)
else
  WhatToCall?(input_filename,output_option)
end