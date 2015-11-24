def circle x, y, r, color
  '<circle cx="'+x.to_s+'" cy="'+y.to_s+'" r="'+r.to_s+'" stroke="black" stroke-width="3" fill="'+color+'" />'
end

File.open("result.svg","w") do |f|
  f.write('<svg xmlns="http://www.w3.org/2000/svg">')
  f.write('<rect x="400" y="300" width="30" height="30" style="fill:purple;stroke-width:3;stroke:rgb(0,0,0)"></rect>')
  f.write(circle 374, 290, 30, 'blue')
  f.write(circle 377, 352, 30, 'green')
  f.write(circle 460, 298, 30, 'yellow')
  f.write(circle 440, 358, 30, 'orange')
  f.write(circle 420, 250, 30, 'brown')
  f.write('<text x="375" y="415" fill="red">Petar Petrov!</text>')
  f.write('</svg>')
end
