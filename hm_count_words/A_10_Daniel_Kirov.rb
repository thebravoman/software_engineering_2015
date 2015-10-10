#!/usr/bin/env ruby
file = ARGV.first
f = File.open(file, "r")
h = Hash.new(0)

f.each_line do |line|
  word = line.gsub(/[^a-z'\n- ]/, '').split(" ")
	
  word.each do |count|
    h[count] = h[count] + 1
  end
  
end

h = h.sort_by {|word, count| [-count, word]}

h.each do |words, number|
	puts "#{words},#{number}"
end