#!/usr/bin/env ruby
file_path = ARGV[0]
f = File.open(file_path, "r")
h = Hash.new(0)

marks_sum = 0

f.each_line do |line|
	marks_sum += line.count("-].\)([,!?:;%@#$^&<_>`~'\"„“*-+/")
	w = line.downcase.gsub(/[^a-z'\n- ]/, ' ').split(" ")
	
	w.each do |words|
		
		h[words] += 1
	end	
end


h = h.sort_by{|words,number| words.downcase}
h = h.sort_by{|words,number| [-number,words]}

h.each do |words, number|
	puts "#{words},#{number}"
end
if marks_sum!=0
	puts "\"marks\",#{marks_sum}"
end
