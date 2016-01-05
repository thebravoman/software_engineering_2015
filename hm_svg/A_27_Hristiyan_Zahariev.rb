require 'json'

input_file = ARGV[0]

filename = File.read(input_file)
json_parser = JSON.parse(filename) 

node_name = ""
children = ""
distance_x = 130
leafs_x = 50
textleafs_x = 0
distance = 0
distance_class = 400
counter = 0

def rect x, y, w, h
  '<rect x="' + x.to_s + '" y = "' + y.to_s + '" width="' + w.to_s + '" height="' + h.to_s + '" style="fill:rgb(9,139,18)" />'
end
	
def circle x, y, r
  '<circle cx="'+x.to_s+'" cy="'+y.to_s+'" r="'+r.to_s+'" stroke="black" stroke-width="3" style="fill:rgb(139,69,19)" />'
end

def lines x1, y1, x2, y2
  '<line x1="'+x1.to_s+'" y1="'+y1.to_s+'" x2="'+x2.to_s+'" y2="'+y2.to_s+'" style="stroke:rgb(139,69,19);stroke-width:3" />'
end

def text x, y, s
  '<text x="'+x.to_s+'" y="'+y.to_s+'" font-size="28" fill="black">'+s.to_s+'</text>'
end

def text_names x, y, s
  '<text x="'+x.to_s+'" y="'+y.to_s+'" font-size="23" fill="rgb(192,0,0)">'+s.to_s+'</text>'
end

File.open("A_27_Hristiyan_Zahariev.svg", "w") do |f|
  f.write('<svg xmlns="http://www.w3.org/2000/svg">')
  json_parser.each do |key1, value1|
    if (counter == 0)
      node_name = key1
      counter+=1
    end
    if(key1 != node_name)
      value1.each do |key2, value2|
        key2.each do |key3, value3|
          if(key3 == node_name)
            f.write(lines 670, 85, (280 + distance_x), 250)
            f.write(circle (285 + distance_x),240,45)
            f.write(text (260 + distance_x), 250, value3) #<----Classes
          else
            value3.each do |key4, value4|
              f.write(rect leafs_x + distance, 500, 140 , 100)
              distance += 100
              leafs_x += 100
                key4.each do |key5, value5|
		  f.write(text_names (leafs_x + textleafs_x - 93), 550, value5) #<-----Names
		  textleafs_x+=100
		  f.write(lines (leafs_x + textleafs_x - 150), 500, distance_class, 270) 
                end			
            end
            distance_class += 500
          end	
          distance_x += 240		
      end	
    end
    else
      f.write(circle 670,80,60)
      f.write(text 630, 85, value1) #<-----TUES
    end
  end
  f.write('<text x="350" y="700" fill="red" font-size="70">Cherry tree Kappa</text>') #<-----Funny text kappa
  f.write('</svg>')
end
