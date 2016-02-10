f = File.open(file, "r")
h = Hash.new(0)
marks = 0

f.each do |word|
	marks = marks + word.count("-].\)([,!?:;%@#$^&<_>`~'\"„“*-+/")
  
	word = word.gsub(/[^a-z'\n- ]/, ' ').split(" ")
	
	word.each do |count|
	h[count] = h[count] + 1

	h.each do |words, number|
		puts "#{words},#{number}" 
	end

if marks != 0
	puts "\"marks\",#{symb_count}" 
end
