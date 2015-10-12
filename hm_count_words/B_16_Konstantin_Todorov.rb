require 'io/console'
word = Hash.new
punctuation_marks = 0
file=File.read(ARGV[0].to_s).split()
file.each do |words|    
    if word.has_key?(words)
        word[words] = word[words] + 1
    else
        word[words] = 1    
    end

end

file=File.read(ARGV[0].to_s).split("")
file.each do |validator|
	if validator == ',' || validator == '.' || validator == '?' || validator == '!' ||  validator == '`' ||  validator == '*' ||  validator == '-' ||  validator == '_'  
		punctuation_marks = punctuation_marks + 1
	end
end


word.sort{|b,a| a[1]<=>b[1]}.each {
    |elements|
    puts "#{elements[0]},#{elements[1]}"
}
if punctuation_marks > 0
puts "marks,#{punctuation_marks}"
end
