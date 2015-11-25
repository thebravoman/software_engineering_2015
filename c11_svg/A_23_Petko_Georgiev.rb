def circle x,y,r,fill
	"<circle cx=\"#{x}\" cy=\"#{y}\" r=\"#{r}\" stroke=\"green\" stroke-width=\"4\" fill=\"#{fill}\" />"
end

def get_rekt x, y, width, height, fill
	"<rect x=\"#{x}\" y=\"#{y}\" width=\"#{width}\" height=\"#{height}\" fill=\"#{fill}\" stroke-width=\"3\" stroke=\"rgb(0,0,0)\" />"
end

def text x, y, blabla
	"<text x=\"#{x}\" y=\"#{y}\" fill=\"black\">#{blabla}</text>"
end

File.open("result.svg", "w") do |f|
	f.write('<svg xmlns="http://www.w3.org/2000/svg">')
	f.write(get_rekt 100, 100, 50,50,"red");
	f.write(circle 125,70,25,"blue");
	f.write(circle 160,175,25,"yellow");
	f.write(circle 90,175,25,"green");
	f.write(circle 180,110,25,"orange");
	f.write(circle 70,110,25,"cyan");
	f.write(text 50,250,"Petko Georgiev")
	f.write('</svg>')
end
