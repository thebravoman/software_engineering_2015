str = {}
marks = 0

file = File.open(ARGV[0], "r")

file.each_line do |line|
  contents = line.downcase.split(/\s([^\,\.\'\"\?\!\-\_\;\:\/\s]*)/)
  contents.each do |index|
    marks += index.count(". ? ! : ; - _ ( ) [ ] ' , \" * ^ \ / " ,)
    index = index.gsub(/[,.()"?!';:-_^]/, "")
 
    if str[index] 
      str[index] += 1
    else
      str[index] = 1
    end
    
  end
end

str = str.sort_by{|index,key| index}
str = str.sort_by {|index,key| [-key,index]}

str.each do|index, key|	
  if(index != "")
    puts "#{index},#{key.to_s}"
  end

end

puts "marks,"+"#{marks}"