require 'json'

file = File.read(File.open(ARGV[0], 'r'))
data = JSON.parse(file)
@svg_code = []
RECT_WIDTH = 50
	RECT_HEIGHT = 25
	RECT_Y = 440
	CIRCLE_Y = 240
	HEAD_Y = 80
	HEAD_X = 505
	R = 60
	HEAD_TEXT_OFFSET_X = -20
	HEAD_TEXT_OFFSET_Y = 8
	CIRCLE_TEXT_OFFSET_X = -12
	CIRCLE_TEXT_OFFSET_Y = 10 
	RECT_TEXT_OFFSET_Y = 45

class SVGDrawer
	def circle(x, y, r, text, xt, yt)
		'<circle cx="'+x.to_s+'" cy="'+y.to_s+'" r="'+r.to_s+'" stroke="black" stroke-width="3" fill="lightgreen" />
		<text x="'+(x+xt).to_s+'" y="'+(y+yt).to_s+'" fill="black">'+text.to_s+'</text>'
	end

	def rect(x, y, w, h, text, yt)
		'<rect x="'+x.to_s+'" y="'+y.to_s+'" width="'+w.to_s+'" height="'+h.to_s+'" style="fill:rgb(0,0,255);stroke-	width:3;stroke:rgb(0,0,0)" />
		<text x="'+x.to_s+'" y="'+(y+yt).to_s+'" fill="black">'+text.to_s+'</text>'
	end

	def line(x1, x2, y1, y2)
		'<line x1="'+x1.to_s+'" y1="'+y1.to_s+'" x2="'+x2.to_s+'" y2="'+y2.to_s+'" style="stroke:rgb(50,50,255);stroke-width:2" />'
	end
end

def svg(content)
	coffset = 285
	roffset = 100
	loffset = 285
	drawer = SVGDrawer.new
	content.each do |key, val|
			if key != 'node_name'
				val.each do |k, v|
					k.each do |a, b|
						if a != 'node_name'
							b.each do |c, d|
								c.each do |e, f|
								@svg_code << drawer.rect(roffset, RECT_Y, RECT_WIDTH, RECT_HEIGHT, f, RECT_TEXT_OFFSET_Y)
								@svg_code << drawer.line(roffset + RECT_WIDTH/2, loffset, RECT_Y, CIRCLE_Y + R/2)
								roffset += 3*RECT_WIDTH
								puts '		'+f
								end
							end
							loffset += HEAD_X - R
						elsif a == 'node_name'
							@svg_code << drawer.circle(coffset, CIRCLE_Y, R/2, b, CIRCLE_TEXT_OFFSET_X, CIRCLE_TEXT_OFFSET_Y)
							@svg_code << drawer.line(coffset, HEAD_X, CIRCLE_Y - R/2, HEAD_Y + R)
							coffset += HEAD_X - R
							puts '	'+b
						end
					end
				end
			elsif key == 'node_name'
				@svg_code << drawer.circle(HEAD_X, HEAD_Y, R, val, HEAD_TEXT_OFFSET_X, HEAD_TEXT_OFFSET_Y)
				puts val
			end
		end
end

svg(data)
@svg_code = @svg_code.join("")
File.open('B_7_Valentin_Stoyanov.svg', 'w') do |f|
	f.write'<svg xmlns="http://www.w3.org/2000/svg">'
	f.write @svg_code
	f.write '</svg>'
end
