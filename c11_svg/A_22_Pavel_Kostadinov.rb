def circle x,y,r
'<circle cx="'+x.to_s+'" cy="'+y.to_s+'" r="'+r.to_s+'" stroke="black" stroke-width="3" fill="red" />'
end
#def eclipse x,y,r1,r2
#'<ellipse cx="'+x.to_s+'" cy="'+y.to_s+'" rx="'+r.to_s+'" ry="50" style="fill:yellow;stroke:purple;stroke-width:2" />'
#end
File.open("result.svg", "w") do |f|
  f.write('<svg xmlns="http://www.w3.org/2000/svg">')
  #f.write('<rect width="300" height="100" style="fill:rgb(0,0,255);stroke-width:3;stroke:rgb(0,0,0)"/>')
  #f.write('<circle cx="50" cy="50" r="40" stroke="black" stroke-width="3" fill="red" />')
  #f.write('<rect x="100" y="100" width="300" height="150" style="fill:blue;stroke:pink;stroke-width:5;opacity:0.5"/>')
  f.write(circle 200,200,70)
  f.write(circle 200,100,30)
  f.write(circle 139, 120,30)
  f.write(circle 105, 175,30)
  f.write(circle 110, 250,30)
  f.write(circle 270, 130,30)
  f.write('<text x="0" y="15" fill="red">Pavel Kostadinov</text>')
 # f.write(eclipse 140,100,30)
  #f.write(circle 10,10,30)
  f.write('</svg>')
end
