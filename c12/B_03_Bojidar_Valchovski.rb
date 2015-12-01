require 'rubygems'
require 'json'

path = ARGV[0]

json = ''

file = File.open(path)
  file.each_line do |line|
  json += line
end


result = JSON.parse(json)

def rectangle x,y,w,h	 
  '
  <rect x="'+x.to_s+'" y="'+y.to_s+'" 
  width="'+w.to_s+'" height="'+h.to_s+'"
  style="fill:lime;stroke:rgb(102,204,0);stroke-width:1.5;"/>
  '
end

$hash_flag = 0

def print_hashmap(result, offset, bar_offset)
  File.open('B_03_Bojidar_Valchovski.svg', 'a') do |f|
	word_spacing = 40
 	bar_width = 150	
  	bar_height = 40

	result.each do |key, value|

        puts ' '*offset + key

    	if $hash_flag == 0
			f.write(rectangle(10,bar_offset, bar_width, bar_height))
		else
			f.write(rectangle(bar_width/2,bar_offset, bar_width, bar_height))
		end       
		bar_offset = bar_offset + bar_height+5

		case value
          when Hash
			if $hash_flag == 1
			  $hash_flag = 0
			  bar_offset = bar_height*7
			else 
			  $hash_flag = 1
            end
            print_hashmap(value, offset + 2, bar_offset + 2)
          when Array
            value.each do |v|
              puts ' '*(offset + 2) + v     
			  f.write(rectangle(bar_width,bar_offset, bar_width, bar_height))
			  bar_offset = bar_offset + bar_height + 5  	
            end
	    end
     end
  end
end

File.open('B_03_Bojidar_Valchovski.svg', 'w') do |f|
  f.write('<svg xmlns="http://www.w3.org/2000/svg">')
end

print_hashmap(result, 0,10)

File.open('B_03_Bojidar_Valchovski.svg', 'a') do |f|
  f.write('</svg>')
end
