require 'json'


def treeNode(x, y, str)
	textX = x - 15
	textY = y + 5
	'<circle cx = "'+x.to_s+'" cy = "'+y.to_s+'" r = "40" stroke = "black" stroke-width = "2" fill = "none"/>'+"\n"+
	'<text x = "'+textX.to_s+'" y = "'+textY.to_s+'" fill = "black">'+str.to_s+'</text> '+"\n"
end



def makeTree(x, y, hash, file, offset)
 
 xDistance = 140
 yDistance = 100
 
 hash.each do |key, value| 
    if value.kind_of?(String)
      file << treeNode(x, y, value)
    elsif value.kind_of?(Hash)
	  file << makeTree(x, y, value, file, offset/2)
	elsif value.kind_of?(Array)
	  value.each do |e|
	    file << makeTree(x, y, e, file, offset)
	    x += xDistance*offset
	  end
	end
	y += yDistance
	puts "#{value}, #{x}, #{y}"
  end
end

jsonFile = ARGV[0]
data = Hash.new()
file = File.read(jsonFile)
data = JSON.parse(file)

File.open('B_14_Ivo_Gerginov.svg', 'w') do |svg|
  svg << '<svg xmlns = "http://www.w3.org/2000/svg" width="10000" height="10000">' + "\n"
  makeTree(60, 60, data, svg, 5)
  svg << '</svg>'
end