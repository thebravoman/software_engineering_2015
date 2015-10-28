file_p = ARGV[0]
hash = Hash.new(0) 
file = FILE.open(file_p, "r")
sum_m = 0

file.each do |line|
	sum_m += line.count("-].\)([,!?:;%@#$^&<_>`~'\"„“*-+/")
        word = line.downcase.gsub(/[^a-z\n ]/, ' ').split(" ")
	
	word.each do |words|
	hash[words] = hash[words] + 1 
  	end
 end
hash = hash.sort_by{|words,number| words.downcase}
hash = hash.sort_by{|words,number| [-number,words]}
hash.each do |words,number|
	puts "#{words}, #{number}"
end
 
if sum_m!= 0
	puts "\"marks\", #{sum_m}"
end
