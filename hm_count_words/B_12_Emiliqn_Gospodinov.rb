result = Hash.new
words = File.read(ARGV[0])
marks_counter = 0
words.each_line do |line|
  wordz = line.downcase.split
  wordz.each do |word|
    marks_counter += word.count(".,!?()[]\"")
    word = word.gsub(/[,()!.?_"]/,'')
    if result.has_key?(word)
      result[word]+=1
    else
      result[word] = 1
    end
  end
end
result.sort{|k,v| v[1]<=>k[1]}.each do |elements|
  puts "#{elements[0]},#{elements[1]}"
end
if marks_counter!=0
  puts '"marks",'+"#{marks_counter}"
end
