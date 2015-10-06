word = Hash.new
file=File.read(ARGV[0]).split
file.each do |words|    
    if word.has_key?(words)
        word[words] = word[words] + 1
    else
        word[words] = 1    
    end
end
word.sort{|b,a| a[1]<=>b[1]}.each { 
    |elements|
    puts "#{elements[0]},#{elements[1]}"
}
