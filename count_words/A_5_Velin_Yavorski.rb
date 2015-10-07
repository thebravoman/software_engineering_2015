filepath = ARGV[0]
h = Hash.new
f = File.open(filepath, "r")

f.each_line do |line|
	words = line.downcase.split
	words.each do |w|
		w = w.gsub(/[ ,()'"„“.?!:; ]/,'')
		if(w!='')
		if(h[w])
			h[w] += 1
		else
			h[w] = 1
		end
		end
	end	
end

sorted_hash = h.sort_by { |key, value| [ -value, key ] } 

sorted_hash.each {|key, value| puts "#{key},#{value}"}

  


