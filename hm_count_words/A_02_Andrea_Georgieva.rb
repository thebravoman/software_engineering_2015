text = ARGV[0]

marks = 0
hash_n = Hash.new
file_o = File.open(text, "r")

file_o.each_line { |line|
  dumy = line.downcase.split
	
  dumy.each { |duma|
  	marks += duma.hash_n("-_,.;:!?(){}")
	 duma = duma.gsub(/[-_,.;:!?(){}]/, '')
  	if hash_n.has_key?(duma)
	    hash_n[duma] += 1
	  else
	  	hash_n[duma] = 1
	  end
  }
  
}

hash_n = hash_n.sort_by { |x, y| [-y, x] }

hash_n.each do |x, y|
	puts "#{x},#{y}"
end
if marks > 0
  puts "\"marks\",#{marks}"
end
