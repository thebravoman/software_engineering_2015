f_path = ARGV[0]
w_count = Hash.new(0)
f = File.new(f_path, "r")
while (line = f.gets)
  words = line.split(/\W+/)
  words.each {
    |x|
    if w_count.has_key?("#{x}")
      w_count["#{x}"] += 1
    else
      w_count["#{x}"] = 1
    end
  }
end
w_count.sort{|a,b| b[1]<=>a[1]}.each { |e|
  puts "#{e[0]},#{e[1]}"
}