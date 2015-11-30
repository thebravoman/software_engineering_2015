def gimme_a_circle x,y,r,color
'
<circle cx="'+x.to_s+'" cy="'+y.to_s+'" r="'+r.to_s+'" stroke="black"
stroke-width="4" fill="'+color.to_s+'" />
'
end

def rectangle x,y,w,h
 '
  <rect width="'+w.to_s+'" height="'+h.to_s+'"
  style="fill.rgb(0,0,255);stroke:rgb(0,0,0)"/>
 '
end

def write_name x,y,color,text
 '
  <text x="'+x.to_s+'" y="'+y.to_s+'" fill="'+color.to_s+'">'+text.to_s+'</text>
 '
end

File.open("result.svg","w") do |f|
  f.write('<svg xmlns="http://www.w3.org/2000/svg">')
  f.write(rectangle 10,10,100,250)
  f.write(gimme_a_circle 50,50,30,"red")
  f.write(gimme_a_circle 50,125,30,"orange")
  f.write(gimme_a_circle 50,200,30,"green")
  f.write(write_name 5,275,"black","Bojidar Valchovski")
  f.write('</svg>')
end
