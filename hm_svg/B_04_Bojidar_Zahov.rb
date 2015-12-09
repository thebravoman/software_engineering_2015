require 'json'
class Drawing
     def circle(x,y,name) 
	     string = '<circle cx="' + x.to_s + '" cy="' + y.to_s + '" r="40"
	     stroke="black" stroke-width="8" fill="Green" />
  		<text x="' + (x - 21).to_s + '" y="' + (y - 10).to_s + '"
  		font-size="20" font-weight = "bold" fill="black" >' + name.to_s + '</text>'
	     return string
     end

     def rect(x,y,name)
     	string = '<rect width="50" height="50" x="' + x.to_s + '"
     	y="' + y.to_s+ '" style="fill:yellow;stroke-width:6;stroke:green"/>
       	<text x="' + (x - 19).to_s + '" y="' + (y + 76).to_s + '" 
       	font-weight = "bold"
       	font-size="20" fill="black" >' + name.to_s + '</text>'
     	return string
     end

     def lines(x1,y1,x2,y2)
     	string = '<line x1="' + x1.to_s + '" y1="' + y1.to_s + '" x2="'+ 
     	x2.to_s+ '" y2="' + y2.to_s + '" style="stroke:green;stroke-width:6"/>'
     	return string
     end
end
draw = Drawing. new
NUMBER_OF_CHILDREN = 3
#minimum 300 vvvv
SizeConst =   500
#minimum 300 ^^^^
pos = SizeConst/50
pos_classes = SizeConst/10
pos_names_start = SizeConst/10
pos_names = SizeConst/10
pos_start_line = SizeConst
pos_classes_line = pos_classes
children = 0
pos_node = 1;

file = File.read(ARGV[0])
json = JSON.parse(file)

File.open("B_04_Bojidar_Zahov.svg","w") do |f|
     f.write('<svg xmlns="http://www.w3.org/2000/svg">')

	json.each do |key,value|
		if(key == 'node_name')
			pos_node = pos_classes*6
			f.write(draw.circle(pos_node,SizeConst/10,value))		
		
		elsif(key != 'node_name')
			value.each do |y_key, y_hash|
					y_key.each do |z_key, classes|
						if(z_key == 'node_name')

							f.write(draw.circle(pos_classes,\
							SizeConst/4.16,classes))	
	   						f.write(draw.lines(pos_node,\
	   						SizeConst/10,pos_classes_line,SizeConst/4.16))
							pos_classes += SizeConst
							pos_classes_line += SizeConst
							pos_classes_line -= SizeConst/25
							pos_start_line += SizeConst/25
						
    						elsif(z_key == 'children')
							classes.each do |children_key, children_name|
								children_key.each do |name,name_value|
									f.write(draw.rect(pos_names,\
								     SizeConst/2,name_value))
	    							
	    							     f.write(draw.lines(pos_names_start,\
	    							     SizeConst/3.9,pos_names,SizeConst/2))
								
							     	children += 1
						    	     	 if(children == NUMBER_OF_CHILDREN)
						    	     		pos_names_start += SizeConst
						    	     	 end
						    	     	
						    	     	pos_names += SizeConst/5
     
							     	end
							     end
						     end
					     end
			          end
		          end
          	end
     f.write('</svg>')
end
puts "Done!!!"
