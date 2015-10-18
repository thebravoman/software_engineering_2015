fail = ARGV.first
h = Hash.new
f = File.open(file, "r")
zapetaq = 0
f.each_line do |line|
  marks_sum += line.count("!?:;#@%$^&<>_„“*-+/-].\)([,`~'\"")
  duma = line.split
  duma.each do |w|
    if h.has_key?(w)
      h[w] = h[w] + 1
    else
      h[w] = 1
    end
  end
end
h.sort{|a,b| b[1]<=>a[1]}.each { |element|
  puts "#{element[0]},#{element[1]}"
}
if zapetaq!=0
	puts "\"marks\",#{zapetaq}"
end
