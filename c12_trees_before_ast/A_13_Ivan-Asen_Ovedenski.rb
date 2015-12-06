require 'json'

File.open("result.svg","w") do |f|
f.write('<svg xmlns="http://www.w3.org/2000/svg"> ')
end
$x = 500
$y = 40 
  def parse(json,spacing = 0)
    spaces = ' ' * spacing

	File.open("result.svg","a") do |f|

    if(json.class == Hash)
      json.each do |key, value|
        parse value, spacing
      end
    elsif(json.class == Array)
      json.each do |elements|
        parse elements, spacing + 2
      end
    else
      puts "#{spaces}#{json}"
      	  f.write(circle($x, $y))
		  f.write('<text x="'+($x - 20).to_s+'" y="'+$y.to_s+'" fill="red">'+json.to_s+'</text> ')
		  $x+=47
		  $y+=47
    end
   	end
  end
  
  def circle x, y, r = 30
	'<circle cx="'+x.to_s+'" cy="'+y.to_s+'" r="'+r.to_s+'" stroke="black" stroke-width="4" fill="blue" /> ' 
	#'<ellipse cx="'+x.to_s+'" cy="'+y.to_s+'" rx="'+r.to_s+'" ry="50" style="fill:red;stroke:green;stroke-width:2" /></ellipse>'	
	
  end
 
  
filename = ARGV[0]
file = File.read filename
json_to_be_parsed = JSON.parse file
parse json_to_be_parsed
File.open("result.svg","a") do |f|
f.write('</svg>')
end 
