require 'json'

input_file = ARGV[0]

file = File.read(input_file)
data = JSON.parse(file) 

node_name = ""
children = ""
distancex = 130
distanceline = 0
distanceleaf = 50
distanceleaftext = 0
distanceclass = 300
distance = 0
distancemain = 0
counter = 0

def rect x, y, w, h
	'<rect x="' + x.to_s + '" y = "' + y.to_s + '" width="' + w.to_s + '" height="' + h.to_s + '"
	style="fill:rgb(100,0,0)" />'
end
	
def circle x, y, r
	'<circle cx="'+x.to_s+'" cy="'+y.to_s+'" r="'+r.to_s+'"
	stroke="black" stroke-width="3" fill="red" />'
end

def line x1, y1, x2, y2
	'<line x1="'+x1.to_s+'" y1="'+y1.to_s+'" x2="'+x2.to_s+'" y2="'+y2.to_s+'" style="stroke:rgb(255,0,0);stroke-width:2" />'
end

def text x, y, s
	'<text x="'+x.to_s+'" y="'+y.to_s+'" fill="black">'+s.to_s+'</text>'
end

File.open("A_5_Velin_Yavorski.svg", "w") do |f|
  f.write('<svg xmlns="http://www.w3.org/2000/svg">')
  data.each do |key1, value1|
	if(counter == 0)
		node_name = key1
		counter+=1
	end
	if(key1 != node_name)
		value1.each do |key2, value2|
			key2.each do |key3, value3|
				if(key3 == node_name)
					f.write(circle (200 + distancex),300,70)
					f.write(text 180 + distancex, 300, value3)
					f.write(line 500, 150, 350 + distanceline, 250)
				else
					value3.each do |key4, value4|
						f.write(rect distanceleaf + distance, 500, 100, 100)
						distance += 50
						distanceleaf += 100
						key4.each do |key5, value5|
							f.write(text (distanceleaf + distanceleaftext - 80), 550, value5)
							distanceleaftext +=50
							f.write(line (distanceleaf + distanceleaftext - 120), 500, distanceclass, 300)
						end			
					end
					distanceclass += 300
				end	
				distancex += 150
				distanceline +=150		
			end	
		end
	else
		f.write(circle (500+distancemain),100,70)
		f.write(text 480, 100, value1)
		distancemain += 300
	end
  end
  f.write('</svg>')
end