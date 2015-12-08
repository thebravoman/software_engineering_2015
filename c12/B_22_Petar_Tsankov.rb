require 'json'
def circle x,y,rad,r,g,b
	'<circle cx="'+x.to_s+'" cy="'+y.to_s+'" r="'+rad.to_s+'"
	style="fill:rgb('+r.to_s+','+g.to_s+','+b.to_s+');stroke-width=4;stroke:rgb(0,0,0)"/>'
end
def text text,x,y
'<text x="'+x.to_s+'" y="'+y.to_s+'" fill="black">'+text+'</text>'
end
file = File.read('B_26_Plamen_Neshkov.json')
hash_data=JSON.parse(file)

def print_hashmap(json_object,y,x,f,r)
  b=0
  json_object.each do |key, value|
  a = json_object.count-1
    f.write(circle x-a*r*3+b*6*r,y,r,y,x,r)
    f.write(text key.to_s,x-a*r*3+b*6*r,y)
    b=b+1
    ba=0
    xa=x-a*r*3/2+b*3*r
    case value
    when Hash
      print_hashmap(value, y +r*2,x-a*5+b*10,f,r/2)
    when Array
      value.each do |v|
        a=value.count
        f.write(circle xa-a*r*3/2+ba*3*r/2,y +r*2,r/2,y,xa,r)
        f.write(text v.to_s,xa-a*r*3/2+ba*3*r/2,y+r*2)
        ba=ba+1
      end
    end
  end
end

File.open("result.svg","w") do |f|
	f.write('<svg xmlns="http://www.w3.org/2000/svg">')
	print_hashmap(hash_data ,200,500 ,f,100)
	f.write('</svg>')
end
