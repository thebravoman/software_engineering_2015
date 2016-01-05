require 'json'
require 'pp'
a = File.read('B_25_Petyo_Cvetkov.json')

result = JSON.parse(a)

def print_hash(json_object, offset)
  json_object.each do |key, value|
    puts ' '*offset +key
    if value.is_a? String or value.is_a? Numeric
      puts " "*(offset+4) + value.to_s
    else
      value.each do |x|
        print_hash(x, offset + 2)
      end
    end
  end
end
print_hash result, 1


def svg_text(x, y, string)
  %Q|<text x="#{x}" y="#{y}" fill="red">
  #{string}
  </text>|
end

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

def svg hash,svg

pos = 10
pos_classes = 250
pos_names_start = 250
pos_names = 150
pos_start_line = 480
pos_classes_line = pos_classes
pos_counter = 0
	hash.each do |key,value|
		if(key == 'name')

			svg.write(draw_circle(500,50,value))
			puts "#{value}"
			pos =pos +  60

		elsif(key != 'name')
			value.each do |y_key, y_hash|

          y_key.each do |z_key, classes|
						if(z_key == 'index')

							svg.write(draw_circle(pos_classes,150,classes))
	   					svg.write(draw_lines(pos_start_line,50,pos_classes_line,120))
							puts " #{classes}" #<----------------- Puts class

							pos_classes += 500
							pos_classes_line += 500
							pos_classes_line -= 20
							pos_start_line += 20

						elsif(z_key == 'people')
							classes.each do |children_key, children_name|

								children_key.each do |name,name_value|
                  if name == 'name'
                  svg.write(draw_rect(pos_names,250,name_value))
	    							svg.write(draw_lines(pos_names_start,190,pos_names,250))
									puts "  #{name_value}" #<--- Puts names
                end
									pos_counter += 1
						    		if(pos_counter == 3)
						    			pos_names_start += 500
						    		end
						    		pos_names += 150

								end
							end
						end
					end
			end
		end
	end
end


File.open("B_25_Petyo_Cvetkov.svg", "w") do |svg|
  svg << '<svg xmlns="http://www.w3.org/2000/svg">'
  svg << '<svg height="1000" width="1000">'
	svg result, svg
	svg << '</svg>'
end
