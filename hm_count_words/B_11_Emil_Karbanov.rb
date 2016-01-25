the_file = ARGV.first
h = Hash.new
f = File.open(the_file, "r")
f.each_line do |line|
  words = line.split
  words.each do |w|
    if h.has_key?(w)
      h[w] = h[w] + 1
    else
      h[w] = 1
    end
  end
end

h.sort{|a,b| b[1]<=>a[1]}.each { |elem|
  puts "#{elem[0]},#{elem[1]}"
}

