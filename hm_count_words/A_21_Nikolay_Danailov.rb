require 'word_counter'
require_relative './A_21_Nikolay_Danailov/result_printer.rb'

def uri?(string)
  start = string.split('/').first
  start == 'http:' || start == 'https:'
end

def get_result(input)
  if File.file? input
    WordCounter.parse_file input
  elsif uri? input
    WordCounter.parse_webpage input
  else
    WordCounter.parse input
  end
end

if ARGV[0] == '-d'
  folder = ARGV[1]
  format = ARGV[2]
  result = WordCounter.parse_folder folder
  print_result result, format
else
  input = ARGV[0]
  output_format = ARGV[1]
  result = get_result input
  print_result result, output_format
end
