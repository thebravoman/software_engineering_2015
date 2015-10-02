filepath = ARGV[0]
h = Hash.new
f = File.open(filepath, "r")

f.each_line do |line|
	words = line.downcase.split
	words.each do |w|
		w = w.gsub(/[,()'"„“.?:]/,'')
		if(h[w])
			h[w] += 1
		else
			h[w] = 1
		end
	end	
end

h.sort{|a, b| a <=> b}.sort{|a, b| b[1] <=> a[1]}.each do |key, value|	
	puts "#{key},#{value}"
end

