require 'rubygems'
require 'json'

def node x, y
	'<circle cx="'+x.to_s+'" cy="'+y.to_s+'" r="50" stroke="black" stroke-width="3" fill="blue" />'
end

def leaf x, y
	'<rect x="'+x.to_s+'" y="'+y.to_s+'" width="100" height="50" stroke="black"  style="fill:blue; ;stroke-width:5;stroke-opacity:0.9" />' 
end

def printtext  text, x, y
	'<text x="'+x.to_s+'" y="'+y.to_s+'" font-family="sans-serif" font-size="20px"  fill="black" >'+text.to_s+'</text>'
end

def tree (newvalue, x, y, is_child, d)
	new_hash = JSON.parse(newvalue.to_json)
	size = new_hash.count
	counter = 0
	y += 100
	$x += 25
	while counter < size 
		new_hash[counter].each do |key1,value1|
			tree(value1, $x, y, is_child, d)
			if key1 == "node_name"
				is_child = true
			else 
				is_child = false
			end
			end
		counter += 1
		$x += 100
	end
rescue
	if is_child == false	
		d.write(node x , y + 50)
	else
		d.write(leaf x - 35 , y + 25)
	end
	texty = y + 45
	textx = x - 30
	d.write(printtext newvalue,textx , texty)
end

File.open("B_18_Lubomir_Kiprov.svg", "w") do |d|	
	d.write('<svg xmlns="http://www.w3.org/2000/svg">')
	$x = 100
	text=File.open(ARGV[0]).read
	hash = JSON.parse(text)
	hash.each do |key,value|
		tree(value,$x,15,false, d)
	end
	d.write('</svg>')
end
