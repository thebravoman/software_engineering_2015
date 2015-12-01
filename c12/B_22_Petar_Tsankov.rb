require 'json'
def circle x,y,rad,r,g,b
	'<circle cx="'+x.to_s+'" cy="'+y.to_s+'" r="'+rad.to_s+'"
	style="fill:rgb('+r.to_s+','+g.to_s+','+b.to_s+');stroke-width=4;stroke:rgb(0,0,0)"/>'
end
file = File.read('B_26_Plamen_Neshkov.json')
hash_data=JSON.parse(file)

def print_hashmap(json_object,y,f)
  b=0
  json_object.each do |key, value|
    a=0
    json_object.each{a=a+1}
    f.write(circle 50-a*5+b*10,y,5,y,y/2,y*2)
    b=b+1
    case value
    when Hash
      print_hashmap(value, y +20,f)
    when Array
      value.each do |v|
        ##puts ' '*(offset + 20) + v
      end
    end
  end
end

File.open("result.svg","w") do |f|
	f.write('<svg xmlns="http://www.w3.org/2000/svg">')
	print_hashmap(hash_data ,0 ,f)
	f.write('</svg>')
end
