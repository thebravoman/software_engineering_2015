require 'csv'
require 'json'
require 'rexml/document'
require './A_14_Ignat_Georgiev/word_counter.rb'
require_relative './A_14_Ignat_Georgiev/word_counter/result'
command = ARGV[1]
filename = ARGV[0]
def file_site(filename)
  protocol = filename.split('/').first
  return protocol == 'http:' || protocol == "https:"
end
def result(filename,command)
  if File.file? filename
    result = WordCounter.parse_file filename
  elsif file_site filename
    result = WordCounter.parse_webpage filename
  else
    result = Parser.parse filename
  end
end
if command == "json"
 puts result(filename,command).to_json
elsif command == "xml"
 puts result(filename,command).to_xml
elsif command =="svg"
 result(filename,command).to_svg
else
  result(filename,command).to_csv
end

