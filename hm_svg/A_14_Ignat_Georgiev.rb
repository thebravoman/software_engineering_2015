require 'json'

content = File.read(ARGV[0])
parsed = Hash.new
parsed = JSON.parse(content)
def_pos_x = 500
def_pos_y = 200
temp_x=400
temp_y=150
def rect x,y,name
string='<rect width="60" y="'+y.to_s+'" x="'+x.to_s+'" height="60" style="fill:rgb(255,255,255);stroke-width:3;stroke:rgb(0,0,0)"/>'+
'<text x="' +x.to_s + '" y="' +(y+40).to_s + '" font-size="12" fill="black" >' + name.to_s + '</text>'
end
def circle x,y,name 
string = '<circle cx="'+x.to_s+'" cy="'+y.to_s+'" r="50" stroke="black" stroke-width="3" fill="white" />' + 
'<text x="' + (x - 25).to_s + '" y="' + (y - 5).to_s + '" font-family="Verdana" font-size="20" fill="black" >' + name.to_s + '</text>'
end
def line x, y, x1, y1
  '<line x1="'+x.to_s+'" y1="'+y.to_s+'" x2="'+x1.to_s+'" y2="'+y1.to_s+'" style="stroke:rgb(139,69,19);stroke-width:3" />'
end
File.open("A_14_Ignat_Georgiev.svg","w") do |f|
	f.write('<svg xmlns="http://www.w3.org/2000/svg">')
	parsed.each do |key,value|
		if key == 'node_name'
		puts value
		#f.write(lines 670, 85, (280 + def_pos_x), 250)
		f.write(circle(def_pos_x,def_pos_y,value))
		def_pos_y += 200
		elsif key != 'node_name'
			def_pos_x -= 100
			value.each do |new_key,new_value|
				new_key.each do |newer_key,classes|
					if (newer_key=='node_name')
						puts " "+classes
						#f.write(lines(def_pos_x,def_pos_y,def_pos_x-70,def_pos_y+200))
						f.write(circle(def_pos_x,def_pos_y,classes))
						def_pos_x+=200	
					elsif(newer_key=='children')
						classes.each do |newest_key,newest_value|
							newest_key.each do |name,name_value|
								#def_pos_y-=200

								puts "  #{name_value}"
								f.write(lines(def_pos_x-200,def_pos_y,def_pos_x-temp_x,def_pos_y+160))
								f.write(rect(def_pos_x-temp_x,def_pos_y+temp_y,name_value))
								#temp_y-=50
								temp_x -=70

							end
						end
					end
				end
			end
		end
	end
f.write('</svg>')
end
