duma = Hash.new
file=File.read(ARGV[0]).split
file.each do |dumi|    
  if duma.has_key?(dumi)
    duma[dumi] = duma[dumi] + 1
  else
    duma[dumi] = 1    
  end
end
duma.sort{|max,min| min[1]<=>max[1]}.each { 
  |elements|
  puts "#{elements[0]},#{elements[1]}"
}
