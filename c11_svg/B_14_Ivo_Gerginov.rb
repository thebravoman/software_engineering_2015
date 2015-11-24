def Circle(x, y, r, strColor, fillColor)
  '<circle cx="' + x.to_s + '" cy="'+ y.to_s + '" r="'+ r.to_s + '" stroke="' + strColor.to_s + '" stroke-width="4" fill="' + fillColor.to_s + '" />'
end

def Rectangle(x, y, w, h)
  '<rect width="' + w.to_s + '" height="' + h.to_s + '" style="fill:rgb(0,0,0);stroke-width:3;stroke:rgb(0,0,0)" />'
end

def Text x, y, string
	'<text x="' + x.to_s + '" y="' + y.to_s + '" fill="red">' +  string.to_s + '</text>'
end

  File.open("result.svg", 'w') do |f|
  	f.write('<svg xmlns = "http://www.w3.org/2000/svg">')
  	f.write(Rectangle(200, 100, 60, 165))
	f.write(Circle(30, 40, 20, 'black', 'red'))
	f.write(Circle(30, 90, 20, 'black', 'yellow'))
	f.write(Circle(30, 140, 20, 'black', 'green'))
	f.write(Text(30, 220, 'Ivo Gerginov'))
	f.write("</svg>")
  end