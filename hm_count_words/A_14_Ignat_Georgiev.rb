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
def folder(adress)
  files = Dir.glob("#{adress}/**/*").select { |f| File.file? f }
  result = Result.new

  files.each do |file|
    temp = WordCounter.parse_file file
    result.word_counts.merge!(temp.word_counts.to_h) { |_, oldval, newval| newval + oldval }
    result.marks_count += temp.marks_count
  end

  result.word_counts = result.word_counts.sort_by { |word, count| [-count, word] }.to_h
  result
end
if ARGV[0] == '-d'
  filename = ARGV[1]
  command = ARGV[2]
  final = folder filename
  if command == "json"
 puts final.to_json
 final.to_svg
elsif command == "xml"
 puts final.to_xml
 finalto_svg
elsif command =="svg"
 final.to_svg
else
  final.to_csv
 final.to_svg
end
else
if command == "json"
 puts result(filename,command).to_json
 result(filename,command).to_svg
elsif command == "xml"
 puts result(filename,command).to_xml
 result(filename,command).to_svg
elsif command =="svg"
 result(filename,command).to_svg
else
  result(filename,command).to_csv
 result(filename,command).to_svg
end
end