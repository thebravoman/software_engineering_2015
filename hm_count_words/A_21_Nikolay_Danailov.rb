require 'csv'

@input_file = ARGV[0]
@output_format = ARGV[1]

def output_csv word_counts, marks_count
  word_counts.each { |word, count| puts word + "," + count.to_s }
  puts "\"marks\"," + marks_count.to_s
end

def output_json word_counts, marks_count
  
end

def output_xml word_counts, marks_count

end

File.open(@input_file) do |file|
  text = ''

  file.each_line do |line|
    text += line
  end

  marks_count = text.scan(/[,.!?:;"()\[\]]/).count
  words = text.downcase.gsub(/[^a-z'\s-]/, '').split(' ')
  word_counts = Hash.new(0)

  words.each do |word|
    word_counts[word] += 1
  end

  word_counts = word_counts.sort_by { |word, count| [-count, word] }

  if @output_format == "json"
    output_json word_counts, marks_count
  elsif @output_format == "xml"
    output_xml word_counts, marks_count
  else
    output_csv word_counts, marks_count
  end
end
