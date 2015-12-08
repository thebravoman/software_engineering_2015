require 'json'

file = File.read('A_15_Kalin_Karev.json')
p = JSON.parse(file)

node_name = ""
children = ""
disx = 130
disline = 0
disleaf = 80
distext = 0
disclass = 300
dis = 0
dism = 0
counter = 0

def rectangle x, y, w, h
	'<rect width="'+w.to_s+'" height="'+h.to_s+'" x="'+x.to_s+'" y="'+y.to_s+'" style="fill:rgb(255,250,255);stroke-width:3;stroke:rgb(0,0,0)" />'
end

def circle x, y, r, cr, cg, cb
	'<circle cx="'+x.to_s+'" cy="'+y.to_s+'" r="'+r.to_s+'" stroke="red" stroke-width="3" fill="red" style="fill:rgb('+cr.to_s+', '+cg.to_s+', '+cb.to_s+')"/>'
end

def line x1, y1, x2, y2
	'<line x1="'+x1.to_s+'" y1="'+y1.to_s+'" x2="'+x2.to_s+'" y2="'+y2.to_s+'" style="stroke:rgb(255,0,0);stroke-width:2" />'
end

def text x, y, s 
	'<text x="'+x.to_s+'" y="'+y.to_s+'" fill="blue">'+s.to_s+'</text>'
end

File.open("A_15_Kalin_Karev.svg", "w") do |f|
	f.write('<svg xmlns="http://www.w3.org/2000/svg">')
	
	p.each do |k1, v1|
		if(counter == 0)
			node_name = k1;
			counter += 1
		end
		if(k1 != node_name)
			v1.each do |k2, v2|
				k2.each do |k3, v3|
					if(k3 == node_name)
						f.write(circle (200 + disx), 250, 50, 255, 255, 55)
						f.write(text 190 + disx, 240, v3)
						f.write(line 500, 170, 340 + disline, 200)
					else 
						v3.each do |k4, v4|
							f.write(rectangle disleaf + dis, 400, 100, 50)
							dis += 40
							disleaf += 90
							k4.each do |k5, v5|
								f.write(text (disleaf + distext - 85), 430, v5)
								distext += 40
								f.write(line (disleaf + distext - 95), 400, disclass + 25, 300)
							end
						end
						disclass += 300
					end
					disx += 150
					disline += 150
				end
			end
		else 
			f.write(circle (500 + dism), 100, 70, 255, 255, 50)
			f.write(text 480, 100, v1)
			dism += 300		
		end
	end
	
	f.write('</svg>')
end
