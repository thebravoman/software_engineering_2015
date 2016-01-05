require 'word_counter'

def uri?(string)
  beginning = string.split('/').first
  beginning == 'http:' || beginning == 'https:'
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

def write_to_file(file, data)
  File.open(file, 'w') do |f|
    f << data
  end
end

def print_result(result, format)
  if format == 'json'
    puts result.to_json
  elsif format == 'xml'
    puts result.to_xml
  else
    puts result.to_csv
  end

    svg = result.to_svg
    write_to_file('A_29_Yassen_Alexiev.svg', svg)
end

def iterate_folder(folder)
  files = Dir.glob("#{folder}/**/*").select { |f| File.file? f }
  result = WordCounter::Result.new

  files.each do |file|
    temp = WordCounter.parse_file file
    result.word_counts.merge!(temp.word_counts.to_h) { |_, oldval, newval| newval + oldval }
    result.marks_count += temp.marks_count
  end

  result.word_counts = result.word_counts.sort_by { |word, count| [-count, word] }.to_h
  result
end

if ARGV[0] == '-d'
	folder = ARGV[1]
	format = ARGV[2]
	result = iterate_folder folder
	print_result result, format
else
	input = ARGV[0]
	output_format = ARGV[1]
	result = get_result input
	print_result result, output_format
end