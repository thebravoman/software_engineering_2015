require 'json'

input = ARGV[0]

f = File.open(input, 'r')
fcontent = File.read(f)

parsed = JSON.parse(fcontent) 

def circle(x, y, r, text, yt, xt)
	
	'<circle cx="'+x.to_s+'" cy="'+y.to_s+'" r="'+r.to_s+'" stroke="black" stroke-width="3" fill="lightgreen" />
	<text x="'+(x+xt).to_s+'" y="'+(y+yt).to_s+'" fill="black">'+text.to_s+'</text>'
end

def rect(x, y, w, h, text, yt, xt)
	'<rect x="'+x.to_s+'" y="'+y.to_s+'" width="'+w.to_s+'" height="'+h.to_s+'" style="fill:rgb(0,0,255);stroke-width:3;stroke:rgb(0,0,0)" />
	<text x="'+(x+xt).to_s+'" y="'+(y+yt).to_s+'" fill="black">'+text.to_s+'</text>'
end

def line(x1, x2, y1, y2)
	'<line x1="'+x1.to_s+'" y1="'+y1.to_s+'" x2="'+x2.to_s+'" y2="'+y2.to_s+'" style="stroke:rgb(255,0,0);stroke-width:2" />'
end

def svg(hash)
	coffset = 285
	roffset = 100
	File.open('B_7_Valentin_Stoyanov.svg', 'w') do |svg|
		svg.write('<svg xmlns="http://www.w3.org/2000/svg">')
		hash.each do |key, val|
			if key != 'node_name'
				val.each do |k, v|
					k.each do |a, b|
						if a != 'node_name'
							b.each do |c, d|
								c.each do |e, f|
								svg.write(rect(roffset, 440, 50, 25, f, 45, 0))
								roffset += 150
								puts '		'+f
								end
							end
						elsif a == 'node_name'
							svg.write(circle(coffset, 240, 40, b, 10, -12))
							svg.write(line(coffset-40, roffset, 240, 440))
							svg.write(line(coffset, roffset+185, 240+40, 440))
							svg.write(line(coffset+40, roffset+185+150, 240, 440))
							coffset += 445
							puts '	'+b
						end
					end
				end
			elsif key == 'node_name'
				svg.write(circle(505, 80, 60, val, 8, -20))
				svg.write(line(505-60,coffset,80,240-20))
				svg.write(line(505+60,coffset+445,80,240))
				puts val
			end
		end
		svg.write('</svg>')
	end
end

svg(parsed)
