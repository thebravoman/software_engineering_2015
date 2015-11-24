def generate_rect(height, width, x, y, fill)
  result = '<rect id="svg_1" height="#{height}" width="#{width}" y="#{y}" x="#{x}" stroke-width="1.5" stroke="#000" fill="#{fill}"/>'
  result + "\n"
end

def generate_ellipse(ry, rx, cy, cx, fill)
  result = '<ellipse ry="#{ry}" rx="#{rx}" id="svg_2" cy="#{cy}" cx="#{cx}" stroke-width="1.5" stroke="#000" fill="#{fill}"/>'
  result + "\n"
end

def write_name
  result = '<text stroke="#000" transform="matrix(1,0,0,1.0197044246889675,0,-1.4581259039817525) " xml:space="preserve" text-anchor="left" font-family="Helvetica, Arial, sans-serif" font-size="24" id="svg_6" y="386.5" x="192.5" stroke-opacity="null" stroke-width="0" fill="#000000">Ivaylo Arnaudov</text>'
  result + "\n"
end

definition = '<svg width="580" height="400" xmlns="http://www.w3.org/2000/svg">' + "\n"
File.open('result.svg', 'w') do |file|
  file.write(definition)
  file.write(generate_rect(311, 154, 196.5, 52.5, '#fff'))
  file.write(generate_ellipse(38.5, 40, 111, 270.5, '#ff0000'))
  file.write(generate_ellipse(42, 41.5, 206.5, 270, '#ffff00'))
  file.write(generate_ellipse(42, 41.5, 309.5, 269, '#00bf00'))
  file.write('</svg>\n')
end
