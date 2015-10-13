#!/usr/bin/env ruby
file = ARGV.first
f = File.open(file, "r")
h = Hash.new(0)

symb_count = 0

f.each do |word|
  symb_count = symb_count + word.count("-].\)([,!?:;%@#$^&<_>`~'\"*-+/")
  
  word = word.gsub(/[^a-z'\n- ]/, ' ').split(" ")
	
  word.each do |count|
    h[count] = h[count] + 1
  end
  
end

h = h.sort_by {|word, count| [-count, word]}

h.each do |words, number|
	puts "#{words},#{number}"
end

  if symb_count != 0
	puts "\"marks\",#{symb_count}" 
  end
