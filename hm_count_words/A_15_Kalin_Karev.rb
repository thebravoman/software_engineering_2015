filename = ARGV[0].to_s
script = String.new
f = File.open(filename, "r") 
freqs = Hash.new(0)
i = 0
looking_for = [',', '.', '!', '?']

f.each_line do |text|
	looking_for.each do |symbol|
		i = i + text.count(symbol).to_i
	end
	
	words = text.split

	words.each do |val|
		if not(val.gsub!(/\W+/, '') == nil)
			val.gsub!(/\W+/, '')
		end
	
		val = val.downcase
		if not val == ""
			freqs[val]+=1
		end
	end
end

freqs = freqs.sort_by{|word,num| word}
freqs = freqs.sort_by {|word,num| [-num,word]}

freqs.each {|word, freq| puts word+','+freq.to_s}

if not i == 0
	puts "\"marks\",#{i}"
end
