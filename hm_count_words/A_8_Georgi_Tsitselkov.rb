sum_m = 0
hash = Hash.new(0) #imashe space mejdu "new" i "(", a ne trqbva
file=File.read(ARGV[0]).downcase.split(" ") #File.read() samo mu podavash koi fail da
#chete, a ti mu podavashe i "r", koeto poprincip kazva, che kato otvorish faila, shte
#go chetesh, ama to tuka veche e qsno... podava se samo faila
file.each do |word|
	sum_m += word.count(", . ! ? : _ ] [ ) (  + - * @ #  ' $ % ^ & / \ < > ~  " )
  
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
