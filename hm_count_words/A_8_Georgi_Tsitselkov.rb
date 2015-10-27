sum_m = 0
hash = Hash.new(0) 
file=File.read(ARGV[0]).downcase.split(" ") 
file.each do |word|
	sum_m += word.count("-].\)([,!?:;%@#$^&<_>`~'\"„“*-+/")
  
  	word = word.gsub(/[^a-z\n ]/, '')
	
	word.each do |count|
	hash[count] = hash[count] + 1 
  	end
 end

hash = hash.sort_by{|word, number| [-number, word]}
hash.each do |word, number|
	puts "#{word}, #{number}"
end
 
if sum_m != 0
	puts "\"marks\", #{sum_m}"
end
