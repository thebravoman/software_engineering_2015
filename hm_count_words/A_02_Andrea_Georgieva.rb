text = ARGV[0]

marks = 0
hash_n = Hash.new
file_o = File.open(text, "r")

file_o.each_line { |line|
  dumi = line.downcase.split
	
  dumi.each { |c|
  	marks += c.scan(",.;:!?(){}").hash_n
  	c = c.gsub(/[ ,.;:!?(){}]/, '')
  	if hash_n.has_key?(c)
	    hash_n[c] += 1
	  else
	  	hash_n[c] = 1
	  end
  }
  
}

hash_n = hash_n.sort_by { |x, y| [-y, x] }

hash_n.each do |x, y|
	puts "#{x},#{y}"
end
if prep_znachi > 0
  puts "\"marks\",#{marks}"
end
