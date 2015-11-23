require_relative 'A_27_Hristiyan_Zahariev/word_counter.rb'
require 'csv'
require 'json'
require 'rexml/document'

input_filename = ARGV[0]
output_option = ARGV[1]

def checkFileOrSite(filename)
  protocol = filename.split('/').first
  return protocol == 'http:' || protocol == "https:"
end

def result(input_filename,output_option)
  if File.file? input_filename
    result = WordCounter.parse_file input_filename
  elsif checkFileOrSite input_filename
    result = WordCounter.parse_webpage input_filename
  else
    result = Parser.parse input_filename
  end

  if output_option == 'csv'
    result.to_csv
  elsif output_option == 'json'
    result.to_json
  elsif output_option == 'xml'
    result.to_xml
  else
    result.to_csv
  end
  
end 

result(input_filename,output_option)
