require 'json'

entered_file=ARGV[0]
filename=File.read(entered_file)
p=JSON.parse(filename)

def circle x, y, r
	'<circle cx="'+x.to_s+'" cy="'+y.to_s+'" r="'+r.to_s+'"/>'
end

def rectangle x, y, w, h
	'<rect width="'+w.to_s+'" height="'+h.to_s+'" x="'+x.to_s+'" y="'+y.to_s+'" style="fill:rgb(255,255,255);stroke-width:3;stroke:rgb(0,255,255)" />'
end

def line x1, y1, x2, y2
	'<line x1="'+x1.to_s+'" y1="'+y1.to_s+'" x2="'+x2.to_s+'" y2="'+y2.to_s+'" style="stroke:rgb(255,0,0);stroke-width:2" />'
end

def text x, y, s
	'<text x="'+x.to_s+'" y="'+y.to_s+'" fill="red">'+s.to_s+'</text>'
end

node_name = ""
children = ""
disx = 130
disline = 0
disleaf = 50
disleaftext = 0
disclass = 300
dis = 0
dismain = 0
counter = 0

File.open("A_15_Kalin_Karev.svg", "w") do |f|
	f.write('<svg xmlns="http://www.w3.org/2000/svg">')
	p.each do |k1, v1|
		if (counter == 0)
			node_name = k1
			counter += 1
		end
		if (k1 != node_name)
			v1.each do |k2, v2|
				k2.each do |k3, v3|
					if (k3 == node_name)
						f.write(circle (200 + disx), 300, 70)
						f.write(text 180 + disx, 300, v3)
						f.write(line 500, 150, 350 + disline, 250)
					else 
						v3.each do |k4, v4|
							f.write(rectangle disleaf + dis, 450, 100, 100)
							dis += 50;
							disleaf += 100;
							k4.each do |k5, v5|
								f.write(text (disleaf + disleaftext - 80), 510, v5)
								disleaftext += 50;
								f.write(line (disleaf + disleaftext - 120), 500, disclass, 300)
							end
						end
						disclass += 300
					end
					disx += 150;
					disline += 150;
				end
			end
		else
			f.write(circle (500+dismain),100,70)
			f.write(text 480, 100, v1)
			dismain += 300; 
		end
	end
	f.write('</svg>')
end
