require 'json'

file = File.read(ARGV[0])

data_hash = JSON.parse(file)


def draw_tree(topkek,name) 
	string= '<rect width="50" height="' + (size * 10).to_s + '" x="' + x.to_s + '" y="' + y.to_s+ '" style="fill:rgb(0,0,255);stroke-width:3;stroke:rgb(0,0,0)"/>'
	'<text>'	
	return string
end


File.open("A_12_Emil_Lozev.svg","w") do |f|
	
	data_hash.each do |x, y_hash|
		draw_tree()		
		puts "#{x}"
	  y_hash.each do |y, name_hash|
		puts "  #{y}"
	    name_hash.each do |name|
	      puts "    #{name}"
	    end
	  end
	end

end
