filename = ARGV[0].to_s

script = String.new

filename = ARGV[0].to_s
script = String.new
f = File.open(filename, "r") 
freqs = Hash.new(0)

f.each_line do |text|
	text= text.downcase

	words = text.split

	words.each do |val|
		if not(val.gsub!(/\W+/, '') == nil)
			val.gsub!(/\W+/, '')
		end
		freqs[val] += 1 
	end
end

freqs = freqs.sort_by{|word,num| word}
freqs = freqs.sort_by {|word,num| [-num,word]}

freqs.each {|word, freq| puts word+','+freq.to_s}
