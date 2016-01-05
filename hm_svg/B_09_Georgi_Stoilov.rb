require 'json'

class CanYouDraw

  def circle x, y
    '<circle cx="'+x.to_s+'" cy="'+y.to_s+'" r="60" stroke="black" fill="#0066CC" stroke-width="2"/>'
  end

  def add_text x, y, word
    '<text x="'+x.to_s+'" y="'+y.to_s+'" fill="black">'+word.to_s+'</text>'
  end

  def line x1, y1, x2, y2
    '<line x1="'+x1.to_s+'" y1="'+y1.to_s+'" x2="'+x2.to_s+'" y2="'+y2.to_s+'" style="stroke:rgb(0,102,204);stroke-width:3" />'
  end

  def rectangle x, y
    '<rect x="'+x.to_s+'" y="'+y.to_s+'" width="110" height="50" style="fill:rgb(255,255,255);stroke-width:3;stroke:rgb(0,0,0)" />'
  end

end

file = File.read(ARGV[0])
data_hash = JSON.parse(file)
counter_array = 1
$default_x = 300
default_y = 100

def DrawTree x, y, data_hash, counter_array, svg
  draw = CanYouDraw.new()
  line_y1 = 0
  data_hash.each do |key,value|
    if(value.is_a? Hash)
      counter_array = 1
      DrawTree(x, y, value, counter_array, svg)
    end
    if(value.is_a? Array)
      $line_x1 = $default_x
      value.each do |a|
        DrawTree($default_x, y, a, counter_array, svg)
        $default_x = $default_x + 150
      end
    end
    if(value.is_a? String)
      if(counter_array > 0)
        counter_array = 0
        svg << draw.circle(x,y)
        svg << draw.add_text(x,y,value)
      else
        line_y1 = y
        y = y + 220
        svg << draw.circle(x,y)
        svg << draw.line($line_x1,line_y1,x,y)
        svg << draw.add_text(x,y,value)
      end
      counter_array = 0
    end
  end
end

svg = Array.new

DrawTree $default_x, default_y, data_hash, counter_array, svg

File.open("B_09_Georgi_Stoilov.svg", "w") do |f|
  f.write('<svg xmlns="http://www.w3.org/2000/svg" width="10000" height="10000">')
  f.write(svg.join)
  f.write('</svg>')
end
