require 'json'

def draw_circle x, y
  '<circle cx="'+x.to_s+'" cy="'+y.to_s+'" r="60" stroke="black" fill="white" stroke-width="2"/>'
end

def add_text x, y, word
  '<text x="'+x.to_s+'" y="'+y.to_s+'" fill="black">'+word.to_s+'</text>'
end

def line x1, y1, x2, y2
  '<line x1="'+x1.to_s+'" y1="'+y1.to_s+'" x2="'+x2.to_s+'" y2="'+y2.to_s+'" style="stroke:rgb(0,0,255);stroke-width:3" />'
end

def draw_rectangle x, y
  '<rect x="'+x.to_s+'" y="'+y.to_s+'" width="100" height="50" style="fill:rgb(255,255,255);stroke-width:3;stroke:rgb(0,0,0)" />'
end

file = File.read('B_09_Georgi_Stoilov.json')
data_hash = JSON.parse(file)

name = "node_name"
clazz = "children"
space = 2
puts data_hash[name]
for i in 0...2
  puts ' '*space+data_hash[clazz][i][name]
  for count in 0...3
    puts ' '*(space+2)+data_hash[clazz][i][clazz][count][name]
  end
end

default_x = 600
default_y = 100
a = 0
b = 0
c = 60
d = 60
move_left = 300
move_down = 200

File.open("B_09_Georgi_Stoilov.svg", "w") do |f|
  f.write('<svg xmlns="http://www.w3.org/2000/svg" width="2000" height="1000">')
  f.write(draw_circle(default_x, default_y))
  f.write(add_text(default_x-20, default_y+5, data_hash[name]))
  for i in 0...2
    x = default_x-move_left+a
    y = default_y+move_down
    f.write(draw_circle(x, y))
    f.write(add_text(x-20, y+5, data_hash[clazz][i][name]))
    f.write(line(default_x-c/2, default_y+60, x+c/2, y-60))
    for count in 0...3
      f.write(draw_circle(x-move_left+150+b, y+move_down))
      #f.write(draw_rectangle(x-move_left+150+b, y+move_down))
      f.write(add_text(x-move_left+150+b-25, y+move_down+5, data_hash[clazz][i][clazz][count][name]))
      f.write(line(x-d/3, y+60, x-move_left+150+b+d/3, y+move_down-60))
      b = b + 150
      d = d - 60
    end
    b = 0
    d = 60
    c = c - 120
    a = move_left*2
  end
  f.write('</svg>')
end
