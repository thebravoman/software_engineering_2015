def gime_a_circle x,y,r,color
  '<circle cx="'+x.to_s+'" cy = "'+y.to_s+'" r="'+r.to_s+'" stroke="'+color.to_s+'" stroke-width = "4" fill="'+color+'"/>'
end

def rectange x,y,w,h 
   '<rect width="'+w.to_s+'" height="'+h.to_s+'" style="fill:rgb(0,0,0);stroke-width:3;stroke:rgb(0,0,0)"/>'
end

def text x,y
  '<text x="'+x.to_s+'" y="'+y.to_s+'" fill="blue">GEORGI STOILOV!</text>'
end
File.open("result.svg", "w") do |f|
  f.write('<svg xmlns="http://www.w3.org/2000/svg">')
  f.write(rectange 200,100,60,165)
  f.write(gime_a_circle 30,40,15,'red')
  f.write(gime_a_circle 30,80,15,'yellow')
  f.write(gime_a_circle 30,120,15,'green')
  f.write(text 30, 200)
  f.write('</svg>')
end
