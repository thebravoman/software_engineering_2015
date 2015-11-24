
def gime_a_circle x,y,r,stroke,color
  '<circle cx="'+x.to_s+'" cy="'+y.to_s+'" r="'+r.to_s+'" stroke="'+stroke.to_s+'" stroke-width="2" fill="'+color.to_s+'" />'
end

def rectangle x,y,w,h
 '<rect width="'+w.to_s+'" height="'+h.to_s+'" style="fill:rgb(0,0,255);stroke-width:3;stroke:rgb(0,0,0)" />' 
end
def text x,y
  '<text x="'+x.to_s+'" y="'+y.to_s+'" fill="black">Martin Galabov</text>'
end
File.open("result.svg", "w") do |f|
f.write('<svg xmlns="http://www.w3.org/2000/svg">')
f.write(rectangle 0,0,80,220)
f.write(gime_a_circle 40, 40,30, 'black', 'red')
f.write(gime_a_circle 40,110,30, 'black', 'yellow')
f.write(gime_a_circle 40,180,30, 'black', 'green')
f.write(text 10,230)
f.write('</svg>')
end
