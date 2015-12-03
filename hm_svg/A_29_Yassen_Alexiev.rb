require 'json'

input=ARGV[0]
file_contents = File.read(input)
hash = JSON.parse(file_contents) 
	
def circle x, y, r
	'<circle cx="'+x.to_s+'" cy="'+y.to_s+'" r="'+r.to_s+'" fill="green" />'
end

def line x1, y1, x2, y2
	'<line x1="'+x1.to_s+'" y1="'+y1.to_s+'" x2="'+x2.to_s+'" y2="'+y2.to_s+'" style="stroke:rgb(0,0,0);stroke-width:2" />'
end

def rect x, y, w, h
	'<rect x="' + x.to_s + '" y = "' + y.to_s + '" width="' + w.to_s + '" height="' + h.to_s + '"
	style="fill:rgb(0,130,0)" />'
end

def text x, y, s
	'<text x="'+x.to_s+'" y="'+y.to_s+'" fill="black">'+s.to_s+'</text>'
end

node_name = ""
children = ""
radius = 100
distancex = 250
distanceline = 0
distanceleaf = 0
distanceleaftext = 0
distanceclass = 450
distance = 0
distancemain = 100
counter = 0

File.open("A_29_Yassen_Alexiev.svg", "w") do |f|
  f.write('<svg xmlns="http://www.w3.org/2000/svg">')
  hash.each do |key1, value1|
	if(counter == 0)
		node_name = key1
		counter+=1
	end
	if(key1 != node_name)
		radius -= 30
		value1.each do |key2, value2|
			key2.each do |key3, value3|
				if(key3 == node_name)
					f.write(circle (200 + distancex),335,radius)
					f.write(text 180 + distancex, 335, value3)
					f.write(line (200+distancemain), 130+radius, 450 + distanceline, 270)
				else
					value3.each do |key4, value4|
						f.write(rect (distanceleaf + distance + 40), 570, 100, 50)
						distance += 100
						distanceleaf += 100
						key4.each do |key5, value5|
							f.write(text (distanceleaf + distanceleaftext - 40), 600, value5)
							distanceleaftext +=100
							f.write(line (distanceleaf + distanceleaftext - 100), 570, distanceclass, 400)
						end			
					end
					distanceclass += 300
				end	
				distancex += 150
				distanceline +=150		
			end	
		end
	else
		f.write(circle (500+distancemain),100,radius)
		f.write(text 580, 100, value1)
		distancemain += 300
	end
  end
  f.write('</svg>')
end