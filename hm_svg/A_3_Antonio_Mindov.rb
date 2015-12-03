require 'json'

def write_line x,y,x2,y2,width, color
	'<line x1="'+x.to_s+'" y1="'+y.to_s+'" x2="'+x2.to_s+'" y2="'+y2.to_s+'" style="stroke:'+color.to_s+';stroke-width:'+width.to_s+'" />'
end 

def write_node x,y,w,h,text
	'<g>
   		<rect x="' + (x-w/2).to_s + '" y="' + (y-h/2).to_s + '" width="'+w.to_s+'" height="'+h.to_s+'" stroke="black" stroke-width="3" fill="rgb(219,105,11)" />
  		<text text-anchor="middle" x="' + x.to_s + '" y="' + y.to_s + '" font-family="Arial" font-size="16" fill="black" >' + text.to_s + '</text>
	</g>'
end

def write_leaf x,y,w,h,text
	'<g>
   		<ellipse cx="' + x.to_s + '" cy="' + y.to_s + '" rx="'+w.to_s+'" ry="'+h.to_s+'" stroke="black" stroke-width="3" fill="green" />
  		<text text-anchor="middle" x="' + x.to_s + '" y="' + y.to_s + '" font-family="Arial" font-size="16" fill="black" >' + text.to_s + '</text>
	</g>'
end

def write_hash hash, level, cx, cxMax, width, height, f
	if hash.has_key? "children"
		c = 0
		child_size = (cxMax - cx) / hash["children"].count
		hash["children"].each do |h|
			x = cx + c*child_size
			maxX = cx + c*child_size + child_size
			f.write(write_line((cx + cxMax) / 2, level * 120, (x+maxX) / 2, (level+1) * 120, 20/level + 3, 'black'))
			f.write(write_line((cx + cxMax) / 2, level * 120, (x+maxX) / 2, (level+1) * 120, 20/level, 'rgb(219,105,11)'))
			write_hash(h, level+1, x, maxX, [width/1.5, child_size/2].min, height/1.5, f)
			c += 1
		end
		f.write(write_node(cx + (cxMax-cx)/2, level * 120, width, height, hash["node_name"]))
	else
		f.write(write_leaf(cx + (cxMax-cx)/2, level * 120, width, height, hash["node_name"]))
	end

end

def generate_tree hash
	File.open("result.svg", "w") do |f|
		f.write('<svg xmlns="http://www.w3.org/2000/svg" width="100% height = 5000">')
		write_hash(hash, 1, 0, 1111, 100, 60, f)
		f.write('</svg>')
	end
end

file = File.read("input.json")
parsed = JSON.parse(file)
generate_tree(parsed)