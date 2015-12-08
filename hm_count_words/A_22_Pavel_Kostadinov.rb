require 'json'
require 'csv'
require 'rexml/document'
require './A_22_Pavel_Kostadinov/word_counter.rb'
require_relative './A_22_Pavel_Kostadinov/word_counter/result'
filename = ARGV[0]
xml_json = ARGV[1]
def fileOrLink(filename)
  protocol = filename.split('/').first
  return protocol == 'http:' || protocol == "https:"
end
def result(filename,command)
  if File.file? filename
    result = WordCounter.parse_file filename
  elsif fileOrLink filename
    result = WordCounter.parse_webpage filename
  else
    result = Parser.parse filename
  end
end


 
if xml_json == 'json'
  puts result(filename,xml_json).to_json


elsif xml_json == 'xml'
  puts result(filename,xml_json).to_xml

else
  result(filename,xml_json).to_csv
end
