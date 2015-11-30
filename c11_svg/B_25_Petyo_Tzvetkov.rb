

def gime_a_circler x,y,r,col
  '<circle cx="'+x.to_s+'" cy="'+y.to_s+'" r="'+r.to_s+'"
    stroke="black" stroke-width="4" fill="'+col+'" />'
end
def gime_a_rectangle x,y
  '<rect width="'+x.to_s+'" height="'+y.to_s+'"
  style="fill:gray;stroke-width:3;stroke:rgb(0,0,0)"/>
'

end
File.open("result.svg", "w") do |f|

  	f.write('<svg xmlns="http://www.w3.org/2000/svg">')
    f.write(gime_a_rectangle 70, 200)
    f.write(gime_a_circler 35, 35, 30, 'red')
    f.write(gime_a_circler 35, 100, 30, 'yellow')
    f.write(gime_a_circler 35, 165, 30, 'green')
     f.write(text 10, 230, 'Petyo Tzvetkov')
    f.write('</svg>')

end
