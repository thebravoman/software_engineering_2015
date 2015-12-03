require 'tree'
require 'json'
require 'pp'

def rect x,y,text
  '<rect x = "'+x.to_s+'" y = "'+y.to_s+'" width="100" height="50" style=" fill:rgb(255,255,255);stroke-width:3;stroke:rgb(0,0,0)" />
  <text x="'+x.to_s+'" y="'+(y + 25).to_s+'"  width = "25" height = "25" fill="black">'+text.to_s+'</text>'
end
def circle x,y,text
'<circle cx="'+x.to_s+'" cy="'+y.to_s+'" r="60" stroke="black" stroke-width="3" fill="grey" />
<text x="'+(x - 25).to_s+'" y="'+y.to_s+'"  width = "25" height = "25" fill="black">'+text.to_s+'</text>'

end
file = File.read(ARGV[0])
my_hash = JSON.parse(file)
def print_hash(file, set)
  a = 1
  pos_cir_x = 0
  pos_cir_y = 0
  pos_rect_x = 0
  pos_rect_y = 0
  File.open('B_15_Yordan_Yankulov.svg','w') do |f|
    f.write('<svg xmlns="http://www.w3.org/2000/svg">')
    file.each do |key, value|
      puts ' '*set + key
      pos_cir_x  = pos_cir_x + 100
      pos_cir_y = pos_cir_y + 100
      pos_rect_x = pos_rect_x + 100
      pos_rect_y = pos_rect_y + 100
      if a == 1
        f.write(circle 500, 50,key)
        a = 0
      else
      f.write(circle 500 - pos_cir_x, 50 + pos_cir_y , key)

      end
      if value.is_a? String or value.is_a? Numeric
        puts " "*(set+4) + value.to_s
        f.write(rect 500 - pos_rect_x, 100 + pos_rect_y,value)
      else
        value.each do |val|
          print_hash(val, set + 2)
        end
      end
    end
  f.write('</svg>')
  end
end
print_hash my_hash,1
