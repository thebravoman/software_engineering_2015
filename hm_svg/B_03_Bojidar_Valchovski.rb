require 'rubygems'
require 'json'

path = ARGV[0]

json = ''

file = File.open(path)
  file.each_line do |line|
  json += line
end


result = JSON.parse(json)

def circle x, y, text
  '
  <g>	
    <circle cx="'+x.to_s+'" 
			cy="'+y.to_s+'" 
			r="30"
			stroke="grey" 
			stroke-width="2" 
			fill="lightgrey"
	/>
	<text x="' + (x - text.length-15).to_s + '" 
		  y="' + (y + text.length).to_s + '" 
		  font-size="14" 
		  fill="black">' + text.to_s + '
	</text>
  </g>
  '
end

def rectangle x, y, text 
  '
  <g>
	<rect x="'+x.to_s+'" 
	  	  y="'+y.to_s+'" 
	  	  width="100" 
	  	  height="30"
	  	  style="fill:lightgrey;stroke:rgb(137,137,137);stroke-width:2;"
	/>
	<text x="' + (x + 5).to_s + '" 
	      y="' + (y + 21.5).to_s + '" 
	      font-size="14" 
	      fill="black">' + text.to_s + '
    </text>
  </g>
  '
end

def line src_x, src_y, dest_x, dest_y 
  '
  <line x1="' + src_x.to_s + '" y1="' + src_y.to_s + '"
  		x2="' + dest_x.to_s + '" y2="' + dest_y.to_s + '"
		style="stroke:rgb(137,137,137); stroke-width: 2"/>		
  '
end

def print_hashmap(result)
  File.open('B_03_Bojidar_Valchovski.svg', 'a') do |f|
	indent = 2
	fig_x = 380; offset_x = fig_x / 1.25;
	fig_y = 50; offset_y = fig_y / 1.33;
	x_pos = fig_x + 80
    y_pos = fig_y + 29

	result.each do |key, value|
      case key
		when "node_name"
		  puts value
	      f.write(circle(fig_x + 80, fig_y, value))
		  fig_y += 160
		else
	      fig_x -= 50
	      value.each do |node_key, node_value|
		    node_key.each do |hash_key, hash_value|	
		      case hash_key
		        when "node_name"
				  indent -= 2
				  puts " "*(indent+2) + hash_value
				  f.write(circle(fig_x + 30, fig_y, hash_value))
				  f.write(line(fig_x + 30, fig_y - 29, x_pos, y_pos))
				  fig_x += 200
				when "children"
				  indent += 2
				  offset_y = fig_y / 2;
				  hash_value.each do |leaf_key, leaf_value|
				    leaf_key.each do |num, name|
					  name_x_pos = fig_x + 30
				  	  name_y_pos = fig_y + 25
			          puts " "*(indent+2) + name
			          f.write(rectangle(fig_x*0.7 - offset_x, fig_y + offset_y, name))
					  f.write(line(fig_x*0.7 - offset_x + 50 , fig_y + offset_y , name_x_pos - 200 , name_y_pos + 5))
					  offset_x -= 110
                    end
                  end			
			  end
			end
	      end
	  end
    end
  end	
end	

File.open('B_03_Bojidar_Valchovski.svg', 'w') do |f|
  f.write('<svg xmlns="http://www.w3.org/2000/svg">')
end

print_hashmap(result)

File.open('B_03_Bojidar_Valchovski.svg', 'a') do |f|
  f.write('</svg>')
end
