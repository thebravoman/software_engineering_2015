def circle x,y,r,c
  	'<circle cx="'+x.to_s+'" cy="'+y.to_s+'" r="'+r.to_s+'"
  	stroke = "black" stroke-width="4" fill="'+c+'" />'
end

def rectangle x,y
  	'<rect width = "'+x.to_s+'" height = "'+y.to_s+'"
  	style = "fill:pink ; stroke-width : 3; stroke : rgb(0,0,0)"/>'
end

def text x,y,contents
  	'<text x = "'+x.to_s+'" y="'+y.to_s+'">'+contents+'</text>'
end

File.open("result.svg", "w") do |f|
  	f.write('<svg xmlns="http://www.w3.org/2000/svg">')
  	f.write(rectangle 70, 200)
  	f.write(circle 35, 35, 30, 'red')
  	f.write(circle 35, 100, 30, 'yellow')
  	f.write(circle 35, 165, 30, 'green')
  	f.write(text 10, 230, 'Vanessa Stoynova')
	f.write('</svg>')
end
 
