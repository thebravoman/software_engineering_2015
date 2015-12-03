require 'json'

def treeNode(x, y, str)
	'<circle cx = "'+x.to_s+'" cy = "'+y.to_s+'" r = "30" stroke = "black" stroke-width = "2" fill = "yellow"/>' + "\n" +
	'<text x = "'+(x - 15).to_s+'" y = "'+(y+5).to_s+'" fill = "black">'+str.to_s+'</text> ' + "\n"
end

def makeTree(x, y, hash, file) 
  hash.each do |key, value|
    file << treeNode(x, y, key)
    if value.kind_of?(Hash)
	  file << makeTree(x + 60, y + 60, value, file)
	elsif value.kind_of?(Array)
	  value.each do |e|
	    file << makeTree(x + 60, y + 60, e, file)
	  end
	end
  end
end

jsonFile = ARGV[0]
data = Hash.new()
file = File.read(jsonFile)
data = JSON.parse(file)

File.open('B_14_Ivo_Gerginov.svg', 'w') do |svg|
  svg << '<svg xmlns = "http://www.w3.org/2000/svg">' + "\n"
  makeTree(40, 40, data, svg)
  svg << '</svg>'
end