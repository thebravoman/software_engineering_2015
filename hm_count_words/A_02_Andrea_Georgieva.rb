text = ARGV.first

prep_znachi = 0
hash_n = Hash.new(0)
file_o = File.open(text, "r")

file_o.each_line { |line|
  dumi = line.downcase.split
	
  dumi.each { |c|
  	prep_znachi += c.scan(",.;:!?(){}").hash_n
  	c = c.gsub(/[ ,.;:!?(){}]/,'')
  	if hash_n.has_key?(c)
	    hash_n[c] += 1
	  else
	  	hash_n[c] = 1
	  end
  }
  
}

hash_n = hash_n.sort_by { |dumi, c| [-c, dumi] }

hash_n.each do |dumi, num|
	puts "#{dumi},#{num}"
end
if prep_znachi > 0
  puts "\"prep_znachi\",#{prep_znachi}"
end
