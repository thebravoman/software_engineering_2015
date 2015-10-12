filepath = ARGV[0]
h = Hash.new
f = File.open(filepath, "r")
punct = 0

f.each_line do |line|
	words = line.downcase.split
	words.each do |w|
		punct = punct + w.scan(/[ ,()'"„“#$%@.?!:; ]/).count
		w = w.gsub(/[ ,()'"„“#$%@.?!:; ]/,'')
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
if(punct != 0)
  puts "marks,#{punct}"
end
  


