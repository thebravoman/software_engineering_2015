#text = "" (y)
#File.open("./readme.txt", "r").each do |file|
text = "" #tova predi beshe samo za v open()
File.open(ARGV[0]) do |file|
	file.each_line do |line|
		text += line
	end
end
#words = text.split

#text = gets.chomp
#text.downcase!
#words = file.split
marks = text.scan(/[,.!?:;"()\[\]]/).count #sirech priemame za punktuaciq , . ! ? : ; "" () [] i gi broim kolko sa s taq funkciq. MAGIQ! 
words = text.downcase.gsub(/[^a-z\n ]/, '').split(" ") #tuka go napravih da ostavq space-ove za da mojesh da razdelish posle po tqh :D #nz shto ama tuka ostavqshe '!' :D
frequencies = Hash.new(0)
# ще оставя тези коментари ;д ахах ami bez da iskam sig sum go napisala
#tva na 15 red znaesh li kvo pravi? ne e li za malki i golemi bukvi #ama kvo za tqh ami da gi chete #podceti me utre da ti pokaja kakvo sa tezi regular expressions deto se pishat v / /
words.each {|item| frequencies[item] += 1}
#dobre
#mi mai tva e
frequencies = frequencies.sort_by {|item, amount| [-amount, item]} #item.length
#frequencies.reverse!

frequencies.each do |item, amount|
	puts item + "," + amount.to_s
end

if marks > 0
	puts "marks,#{marks}"
end
#ami znachi tova raboti za kakto beshe za predi ok?
# ami to chestno kazano bqhma mn tupi greshki...az tva text = '' si go bqh slovila gore
#mi to na hakatona nai-dolemite bugove bqha nai-tupite greshki :D :D
# taka si e ;d 
#sega da raboti i s punktuaciq, sec
#kvo stava:
#1. da bori znacite
#2. te ne ni trqbvat i pak mojem da gi mahnem na 14 red
#3. gi izpisvame
