def text x,y,_text
 '<text x="' + x.to_s + '" y="' + y.to_s + '" fill="black">'+ _text.to_s + '</text>'
end

def circle x,y,r,color
 '<circle cx="' + x.to_s + '" cy="' + y.to_s + '" r="' + r.to_s + '" stroke="black" stroke-width="3" fill="' + color.to_s + '" />'
end

def rectangle x,y,w,h
 '<rect x="' + x.to_s + '" y="' + y.to_s + '" width="' + w.to_s + '" height="' + h.to_s + '"
  style="fill:rgb(0,0,255);stroke-width:3;stroke:rgb(0,0,0)" />'
end

File.open("result.svg", "w") do |f|
 f.write('<svg xmlns="http://www.w3.org/2000/svg">')
 f.write(rectangle 100, 100, 50, 50)
 f.write(circle 155, 75, 25, 'red')
 f.write(circle 90, 75, 25, 'grey')
 f.write(circle 74, 130, 25, 'green')
 f.write(circle 120, 178, 25, 'pink')
 f.write(circle 177, 140, 25, 'orange')
 f.write(text 100, 300, 'Valentin Yonev')
 f.write('</svg>')
end
