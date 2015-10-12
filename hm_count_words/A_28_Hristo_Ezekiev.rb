path = ARGV.first
dumi = Hash.new(0)
file = File.open(path, "r")

file.each_line do |line|
  word = line.downcase.gsub(/[^\w\s]/, '').split(" ")
	
  word.each do |counter|
    dumi[counter] = dumi[counter] + 1
  end
  
end

dumi.sort{|x, y| x <=> y}.sort{|x, y| y[1] <=> x[1]}.each do |word, counter|	
	puts "#{word},#{counter}"
end
