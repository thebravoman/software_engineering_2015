hash = Hash.new
file=File.read(ARGV[0]).downcase
file.each do |word|
	
   if hash.has_key?(word)
      hash[word] += 1
   else
      hash[word] = 1
   end
 	
 end
 hash.sort{|b,a| a[1]<=>b[1]}.each {
  |elements|
  puts "#{elements[0]},#{elements[1]}"
  }