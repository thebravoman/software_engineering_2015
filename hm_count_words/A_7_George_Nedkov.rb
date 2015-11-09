dum = 0
 h= Hash.new(0) 
file=File.read(ARGV[0]).downcase.split(" ") 
file.each do |word|
dum += word.count("-].\\)([,!?:;%@#$\^&<_>`~'\"„“*-+/" )
word = word.gsub(/[^a-z\n ]/, '')
word.each do |count|
h[count] = h[count] + 1
end
end
h = h.sort_by{|word, number| [-number, word]}
h.each do |word, number|
puts "#{word}, #{number}"
end
if dum != 0
puts "\"marks\", #{dum}"
end
