require 'json'

input_file = ARGV[0]

json_file = File.read(input_file)
hash = JSON.parse(json_file)

def draw_node(x, y, string)
	'
		<circle cx = "'+x.to_s+'" cy = "'+y.to_s+'" r = "30" stroke = "black" stroke-width = "3" fill = "white"/>
		<text x = "'+(x - 20).to_s+'" y = "'+(y+10).to_s+'" fill = "black">'+string.to_s+'</text> 
	'
end

def head
	'<svg xmlns = "http://www.w3.org/2000/svg">'
end

$svg = ''
$x_axis = 400
$y_axis = 20
#$counter = 0
def print_svg_tree(hash)
	hash.each do |key, value|
		$svg << draw_node($x_axis, $y_axis, key)

		#$counter += 1
		$y_axis += 50
		if value.kind_of?(Hash)
			$x_axis += 25
			print_svg_tree(value)
		elsif value.kind_of?(Array)
			#if $counter == 2
			#	$counter = 0
			#	$x_axis += 80
			$x_axis += 25
			value.each do |elem|
				print_svg_tree(elem)
			end
			#else
			#	$x_axis -= 40
			#	value.each do |elem|
			#		print_svg_tree(elem)
			#	end
			#end
		end
	end
end

$svg << head

print_svg_tree(hash)
$svg << '</svg>'

File.open('B_28_Toma_Marinov.svg', 'w') do |file|
	file.write($svg)
end