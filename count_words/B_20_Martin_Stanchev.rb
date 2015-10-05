str = {}

file = File.open(ARGV[0], "r")

file.each_line do |line|
  contents = line.downcase.split(/\s([^\,\.\s]*)/)
  contents.each do |index|
    index = index.gsub(/[,.()"]/,'')
    if str[index]
      str[index] += 1
    else
      str[index] = 1
    end
  end
end

str.sort {|a,b| b[1] <=> a[1]}.each do |key, value|
  puts "#{key},#{value}"
end