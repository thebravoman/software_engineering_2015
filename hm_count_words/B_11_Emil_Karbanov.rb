the_file = ARGV.first
h = Hash.new
f = File.open(the_file, "r")
comma = 0

f.each_line do |line|
  marks_sum += line.count("-].\)([,!?:;#@%$^&<>_`~'\"„“*-+/")
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
if comma!=0
	puts "\"marks\",#{comma}"
end
