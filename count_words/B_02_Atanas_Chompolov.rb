
file_path = ARGV[0]
new_Hash = Hash.new
file = File.open(file_path, "r")


file.each_line do |line|
  line.downcase.split.each do |word|
    word = word.gsub(/[,()'"„“.?:]/,'')
      if(new_Hash[word])
        new_Hash[word] += 1
      else
        new_Hash[word] = 1
      end
    end
end


new_Hash.sort{|k, c| k <=> c}.sort{|k, c| c[1] <=> k[1]}.each do |key, occurrences|
  puts "#{key},#{occurrences}"
end
