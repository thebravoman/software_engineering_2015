#root, child node, leaf, sibblings
require 'rubygems'
require 'json'

def node x, y
	'<circle cx="'+x.to_s+'" cy="'+y.to_s+'" r="10" stroke="black" stroke-width="3" fill="blue" />'
end

def leaf
	'<rect x="150" y="10" width="10" height="100" style="fill:blue;stroke:pink;stroke-width:5;fill-opacity:0.1;stroke-opacity:0.9" />' 
end

def tree (newvalue, x, y)
begin
	new_hash = JSON.parse(newvalue.to_json)
	size = new_hash.count
	counter = 0
	x = x + 69
	y = y + 70
	yz = y
	while counter < size
		
		new_hash[counter].each do |key1,value1|	
			
			tree(value1,y , x)
		end
		y = yz
		x = x + 55
		
		counter = counter + 1
	end
	end
rescue
	puts x,y
	puts
	File.open("Svg1.svg", "a") do |d|	
	d.write(node x, y)
	cy = y + 30
	d.write('<text x="'+x.to_s+'" y="'+cy.to_s+'" font-family="sans-serif" font-size="20px" fill="black" >'+newvalue.to_s+'</text>')
	end
end

def openfile
	File.open("Svg1.svg", "w") do |d|	
		d.write('<svg xmlns="http://www.w3.org/2000/svg">')
	end
end

def closefile
	File.open("Svg1.svg", "a") do |d|	
		d.write('</svg>')
	end
end


#File.open("Svg1.svg", "w") do |d|
	
openfile

text=File.open(ARGV[0]).read
hash = JSON.parse(text)
hash.each do |key,value|
	tree(value,10,15)
end

closefile	



