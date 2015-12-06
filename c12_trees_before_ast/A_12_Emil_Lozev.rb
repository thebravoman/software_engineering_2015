require 'json'

file = File.read(ARGV[0])

data_hash = JSON.parse(file)


def draw_circle(x,y,name) 
	string = '	
	<g>
   		<circle cx="' + x.to_s + '" cy="' + y.to_s + '" r="40" stroke="black" stroke-width="3" fill="red" />
  		<text x="' + (x - 25).to_s + '" y="' + (y - 5).to_s + '" font-family="Verdana" font-size="20" fill="black" >' + name.to_s + '</text>
	</g>'
	return string
end

def draw_rect(x,y,name)
	string = '	
	<g>
   		<rect width="50" height="50" x="' + x.to_s + '" y="' + y.to_s+ '" style="fill:rgb(0,0,255);stroke-width:3;stroke:rgb(0,0,0)"/>
  		<text x="' + (x - 25).to_s + '" y="' + (y + 70).to_s + '" font-family="Verdana" font-size="20" fill="black" >' + name.to_s + '</text>
	</g>'
	return string
end

def draw_lines(x1,y1,x2,y2)
	string = '<line x1="' + x1.to_s + '" y1="' + y1.to_s + '" x2="' + x2.to_s+ '" y2="' + y2.to_s + '" style="stroke:rgb(255,0,0);stroke-width:2"/>'
	return string
end

pos = 10
pos_classes = 250
pos_names_start = 250
pos_names = 150
pos_start_line = 480
pos_classes_line = pos_classes
pos_counter = 0

File.open("A_12_Emil_Lozev.svg","w") do |f|
	f.write('<svg xmlns="http://www.w3.org/2000/svg">')
	data_hash.each do |x, y_hash|

		f.write(draw_circle(500,50,x))		
		pos += 60
		puts "#{x}"
	  
	  	y_hash.each do |y, name_hash|
	  		f.write(draw_circle(pos_classes,150,y))	
	   		f.write(draw_lines(pos_start_line,50,pos_classes_line,120))

			pos_classes += 500
			pos_classes_line += 500
			pos_classes_line -= 20
			pos_start_line += 20
			puts "  #{y}"
	    	name_hash.each do |name|
	    		f.write(draw_rect(pos_names,250,name))
	    		f.write(draw_lines(pos_names_start,190,pos_names,250))
	    		pos_counter += 1
	    		if(pos_counter == 3)
	    			pos_names_start += 500
	    		end
	    		pos_names += 150
	      		puts "    #{name}"
	    	end
	  	end
	end
	f.write('</svg>')
end
