def gime_a_circle x,y,r,colour_b,colour_f
'<circle cx="'+x.to_s+'" cy="'+y.to_s+'" r="'+r.to_s+'" stroke="'+colour_b.to_s+'" stroke-width="4" fill="'+colour_f.to_s+'" />'
end
def rectange x,y,w,h
'<rect width="'+w.to_s+'" height="'+h.to_s+'" style="fill:rgb(0,0,0);stroke-width:3;stroke:rgb(0,0,0)"/>'
end
File.open("result.svg","w") do |f|

f.write('<svg xmlns="http://www.w3.org/2000/svg">')
f.write(rectange 200,200,65,190)
f.write(gime_a_circle 32,32,30,"gray","red")
f.write(gime_a_circle 32,92,30,"gray","yellow")
f.write(gime_a_circle 32,155,30,"gray","green")

f.write('</svg>')
end
