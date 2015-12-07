require 'json'

def gime_a_circle x, y, z
	'<circle cx ="'+x.to_s+'" cy = "'+y.to_s+'" r = "'+z.to_s+'" stroke = "green"
	stroke-width = "4" fill="green" />'
end

def line x1, y1, x2, y2
  '<line x1="'+x1.to_s+'" y1="'+y1.to_s+'" x2="'+x2.to_s+'" y2="'+y2.to_s+'" style="stroke:rgb(255,0,0);stroke-width:2" />' 
end

def write_a_text w, h, content
	'<text x="'+w.to_s+'" y="'+h.to_s+'" fill="black">'+content.to_s+'</text>'
end

content = File.read(ARGV[0])
str = JSON.parse(content)

def parse(str, balance)
	str.each do |value, key|
		puts ' '*balance + value

		File.open("B_20_Martin_Stanchev.svg", "w") do |f|
			f.write('<svg xmlns = "http://www.w3.org/2000/svg">')

			f.write(gime_a_circle(500, 70, 50))
			f.write(line(500, 120, 350, 200))
			f.write(line(500, 120, 650, 200))
			f.write(write_a_text(500, 70, value))

			f.write(gime_a_circle(350, 200, 50))
			f.write(write_a_text(350, 150, key.split(/\W + \s /)))

			f.write(gime_a_circle(650, 200, 50))
			f.write(write_a_text(650, 150, key))

			f.write('</svg>')
		end

		case key
			when Hash
				parse(key, balance + 2)
			when Array
				key.each do |index|
				puts ' '*(balance+2) + index
			end
		end
	end
end

parse(str, 0)



