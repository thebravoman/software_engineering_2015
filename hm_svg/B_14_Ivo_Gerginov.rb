require 'json'


x = 40
y = 40

def treeNode(x, y, str)
	'<circle cx = "'+x.to_s+'" cy = "'+y.to_s+'" r = "40" stroke = "black" stroke-width = "2" fill = "none"/>' + "\n" +
	'<text x = "'+(x - 15).to_s+'" y = "'+(y+5).to_s+'" fill = "black">'+str.to_s+'</text> ' + "\n"
end

def makeTree(hash, file) 
  hash.each do |key, value|
    file << treeNode(x, y, key)
    x += 100
    if value.kind_of?(Hash)
	  file << makeTree(value, file)
	elsif value.kind_of?(Array)
	  value.each do |e|
	  	y+= 100
	    file << makeTree(e, file)
	  end
	end
  end
end

jsonFile = ARGV[0]
data = Hash.new()
file = File.read(jsonFile)
data = JSON.parse(file)

File.open('B_14_Ivo_Gerginov.svg', 'w') do |svg|
  svg << '<svg xmlns = "http://www.w3.org/2000/svg" width="10000" height="10000">' + "\n"
  makeTree(data, svg)
  svg << '</svg>'
end