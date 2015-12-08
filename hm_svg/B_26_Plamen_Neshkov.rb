require 'json'

json_string = File.read(ARGV[0])
json_object = JSON.parse(json_string)

def text(content, x, y)
  %Q|<text x="#{x}" y="#{y}" fill="white">
  #{content}
  </text>|
end

def circle(cx, cy, r)
  %Q|<circle cx="#{cx}" cy="#{cy}" r="#{r}"
  stroke="black" stroke-width="3" fill="red" />|
end

def rectangle(x, y, w, h)
  %Q|<rect width="#{w}" height="#{h}"
  style="fill:rgb(0,0,255);stroke-width:3
  ;stroke:rgb(0,0,0)" x="#{x}" y="#{y}"/>|
end

$x = 100
$y = 100

def generate_svg(json_object)
  if json_object['node_name']
    if json_object['children']
      $svg << circle($x+20, $y-5, 50)
    end

    $svg << text(json_object['node_name'], $x, $y)
    $y += 120

    if json_object['children']
      json_object['children'].each do |child|
        $svg << rectangle($x-25, $y-50, child['node_name'].length*5 + 80, 100) unless child['children']
        generate_svg(child)
        $x += child['node_name'].length*5 + 100
      end
    end

    $y -= 120
  end
end

File.open('B_26_Plamen_Neshkov.svg', 'w') do |f|
  f.write('<svg width="1000" height="1000"
           xmlns="http://www.w3.org/2000/svg">')

  $svg = ""
  generate_svg(json_object)
  f.write($svg)

  puts $svg

  f.write('</svg>')
end
