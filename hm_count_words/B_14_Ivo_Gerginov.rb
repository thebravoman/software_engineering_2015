f_path = ARGV[0]
w_count = Hash.new(0)
puncts = Array.new(40)


marks = 0
f = File.new(f_path, "r")
while (line = f.gets)
  line.split(""). each do |l|
    "!\"\#$%&'()*+,-./:;<=>?@[\\]^_`{|}~#".split("").each do |c|
      if (c == l)
      	marks += 1
      end
    end
  end
  
  line = line.gsub!(/[!.?,;*<>=@~+-]/, "")
  line = line.downcase
  words = line.split(/\W+/)
  
  words.each{ |x|	
    if w_count.has_key?("#{x}")
      w_count["#{x}"] += 1
    else
      w_count["#{x}"] = 1
      
    end
  }
end

w_count.sort{|a,b| a[0]<=>b[0]}.each{ |e|
  puts "#{e[0]},#{e[1]}"
}
puts "\"marks\",#{marks}"
