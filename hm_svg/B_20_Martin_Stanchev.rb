require 'json'


def write_a_rectangle x, y, text
        '<rect  x = "'+x.to_s+'" y= "'+y.to_s+'" width = "100" height = "100"
      style="fill:green;stroke-width:0;stroke:rgb(0,0,0)"/>
      <text x="'+(x+30).to_s+'" y="'+(y+50).to_s+'" fill="black">'+text.to_s+'</text>'

end

def write_a_circle x, y, text
  '<circle cx ="'+x.to_s+'" cy = "'+y.to_s+'" r = "50"
	stroke = "green" stroke-width = "4" fill="green" />
        <text x="'+(x-30).to_s+'" y="'+(y-10).to_s+'" fill="black">'+text.to_s+'</text>'
end

def write_a_line x1, y1, x2, y2
  '<line x1="'+x1.to_s+'" y1="'+y1.to_s+'" x2="'+x2.to_s+'" y2="'+y2.to_s+'"
	 style="stroke:rgb(255,0,0);stroke-width:1" />'
end

def write_a_text x, y, content
  '<text x="'+x.to_s+'" y="'+y.to_s+'" fill="black">'+content.to_s+'</text>'
end

content = File.read(ARGV[0])
str = JSON.parse(content)

node_x = 800
node_y = 100

leaf_x = 300
leaf_y = 500

File.open("B_20_Martin_Stanchev.svg", "w") do |file|
  file.write('<svg xmlns="http://www.w3.org/2000/svg">')
  
  str.each do |value, key|
    if value == 'node_name'
      
      file.write(write_a_circle(node_x, node_y, value))
      file.write(write_a_line(node_x, node_y + 50, node_x - 200, node_y + 200))
      file.write(write_a_line(node_x, node_y + 50, node_x + 200, node_y + 200))
      
      
      node_y += 100
    else
      node_x -= 100
      
      key.each do |class_node|
        class_node.each do |c, klass|
          if c == 'node_name'
            file.write(write_a_circle(node_x - 100, node_y + 100, klass))
            
            node_x += 400
          elsif c == 'children'
            klass.each do |names|
              names.each do |name, name_value|
               
               file.write(write_a_rectangle(leaf_x,leaf_y,  name_value))
               file.write(write_a_line(node_x - 500, node_y + 150, leaf_x + 50, leaf_y ))
               
               leaf_x += 200
              end
            end
          end
        end
      end
    end
  end
  
  file.write('</svg>')
end



















=begin
def parse(str)
  
  width = 850
  height = 150
  side_offset = 550
  leaf_x = 250
  leaf_y = 650
  
  File.open("B_20_Martin_Stanchev.svg", "w") do |f|
    f.write('<svg xmlns="http://www.w3.org/2000/svg">')

    str.each do |a, b|
      puts a
      f.write(write_a_circle(width, height, a))
      
      height += 300
      
      b.each do |class_number, names|
        puts class_number
        puts names
          
        f.write(write_a_circle(side_offset, 400, class_number))
          
        side_offset += 600
        
        names.each do |student|
            f.write(write_a_rectangle(leaf_x, leaf_y, student))
            leaf_x += 250

        end
      end
    end
    
    f.write('</svg>')
    
  end
end

parse(str)
=end

