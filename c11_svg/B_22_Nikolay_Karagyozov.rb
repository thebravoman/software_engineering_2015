black_rect = '<rect width="100" height="350" stroke="black" fill="black" />'
red_light = '<circle cx="50" cy="50" r="40" stroke-width="3" fill="red" />'
yellow_light = '<circle cx="50" cy="150" r="40" stroke-width="3" fill="yellow" />'
green_light = '<circle cx="50" cy="250" r="40" stroke-width="3" fill="green" />'
name_text = '<text x="0" y="400" fill="black">Nikolay Karagyozov</text>'
File.open("result.svg", "w") do |f|
  f.write('<svg xmlns="http://www.w3.org/2000/svg">')
  f.write(black_rect)
  f.write(red_light)
  f.write(yellow_light)
  f.write(green_light)
  f.write(name_text)
  f.write("</svg>")
end
