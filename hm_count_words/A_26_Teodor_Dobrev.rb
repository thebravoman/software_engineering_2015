require 'csv'
require 'json'
require 'rexml/document'

file_path = ARGV[0] || "text.txt"
WORDS_COUNT = {}
file = File.open(file_path, "r")

marks = 0

file.each_line do |line|
  words = line.downcase.split(" ")
  words.each do |word|
	marks = marks + word.scan(/[  (){}.,|\1234567890="'*&^%$#@!?;:  ]/).count
    word = word.gsub(/[  (){}.,|\1234567890="'+-_*&^%$#@!?;:  ]/,'')
    if (word != "")
		if WORDS_COUNT[word]
		  WORDS_COUNT[word] += 1
		else
		  WORDS_COUNT[word] = 1
		end
	end
  end
end

WORDS_COUNT = WORDS_COUNT.sort_by {|key, value| [-value, key]}

WORDS_COUNT.each do |key,value|
  puts "#{key} => #{value}"
end

puts "\"marks\",#{marks}" if (marks != 0)
