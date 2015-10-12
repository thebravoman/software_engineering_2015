text = ARGV.first;

hash_n = Hash.new(0);
file_o = File.open(text, "r");

file_o.each_line do |line|
  dumi = line.downcase.split;
	
  dumi.each do |c|
    hash_n[c] += 1;
  end
  
end

hash_n = hash_n.sort_by { |dumi, c| [-c, dumi] };

hash_n.each do |dumi, num|
	puts "#{dumi},#{num}";
end