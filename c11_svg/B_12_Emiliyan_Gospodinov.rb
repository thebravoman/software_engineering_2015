def gime_a_red_circle x,y,r
  '<circle cx="'+x.to_s+'" cy="'+y.to_s+'" r="'+r.to_s+'"
  stroke="black" stroke-width="4" fill="red" />'
end

def gime_a_yellow_circle x,y,r
  '<circle cx="'+x.to_s+'" cy="'+y.to_s+'" r="'+r.to_s+'"
  stroke="black" stroke-width="4" fill="yellow" />'
end

def gime_a_green_circle x,y,r
  '<circle cx="'+x.to_s+'" cy="'+y.to_s+'" r="'+r.to_s+'"
  stroke="black" stroke-width="4" fill="green" />'
end

def gime_a_rect w,h
 '<rect width="'+w.to_s+'" height="'+h.to_s+'" 
 style="fill:rgb(0,0,0);stroke-width:3;stroke:rgb(0,0,0)" />'
end

def gime_my_name x_,y_,name
  '<text x="'+x_.to_s+'" y="'+y_.to_s+'" fill="black">'+name.to_s+'</text>'
end
# lqvo,gore,obikolka
File.open("result.svg","w") do |f|
  f.write('<svg xmlns="http://www.w3.org/2000/svg">')
  f.write(gime_a_rect 40,100)
  f.write(gime_a_red_circle 22,20,15)
  f.write(gime_a_yellow_circle 22,50,15)
  f.write(gime_a_green_circle 22,80,15)
  f.write(gime_my_name 10,150,'Emiliyan Gospodinov')
  f.write('</svg>')
end
