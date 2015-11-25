def circle(x, y, r)
  '<circle cx="' + x.to_s + '" cy="' + y.to_s + '" r="' + r.to_s + '" stroke="black" stroke-width="3" fill="red" />'
end

def rect(x, y, w, h)
  '<rect x="' + x.to_s + '" y="' + y.to_s + '" width="' + w.to_s + '" height="' + h.to_s + '" style="fill:rgb(0,0,255);stroke-width:3;stroke:rgb(0,0,0)" />'
end

def text(x, y, str)
  '<text x="' + x.to_s + '" y="' + y.to_s + '" fill="black">' + str + '</text>'
end

File.open('result.svg', 'w') do |f|
  f.write('<svg xmlns="http://www.w3.org/2000/svg">')
  f.write(rect 115, 110, 50, 50)
  f.write(circle 90, 80, 30)
  f.write(circle 170, 70, 30)
  f.write(circle 200, 150, 30)
  f.write(circle 150, 200, 30)
  f.write(circle 80, 170, 30)
  f.write(text 80, 280, 'Nikolay Danailov')
  f.write('</svg>')
end