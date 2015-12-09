require 'json'

OUTPUT_FILE_NAME = 'B_22_Nikolay_Karagyozov.svg'
SVG_LINE_TEMPLATE = '<line x1="%s" y1="%s" x2="%s" y2="%s" />'
SVG_CIRCLE_TEMPLATE = '<circle cx="%s" cy="%s" r="%s" stroke="black" stroke-width="3" fill="red" />'
SVG_TEXT_TEMPLATE  = '<text x="%s" y="%s" fill="blue">%s</text>'

DEFAULT_CIRCLE_RADIUS = 40 # node radius
DEFAULT_NAME_OFFSET_FACTOR = 5 # centers text in node
DEFAULT_VERTICAL_OFFSET_FACTOR = 50 # positions node vertically
DEFAULT_HORIZONTAL_OFFSET_FACTOR = 100 # positions node horizontally

def get_line(x1, y1, x2, y2)
  SVG_LINE_TEMPLATE % [x1.to_s, y1.to_s, x2.to_s, y2.to_s]
end

def get_circle(x1, y1, radius)
  SVG_CIRCLE_TEMPLATE % [x1.to_s, y1.to_s, radius.to_s]
end

def get_text(x, y, text)
  SVG_TEXT_TEMPLATE % [x, y, text]
end

def DFS(drawer, hash, depth, sibling_id)
  if hash.kind_of?(Array)
    hash.each { |element| DFS(drawer, element, depth + 1, sibling_id += 1) }
  elsif hash.kind_of?(Hash)
    hash.values.each { |element| DFS(drawer, element, depth + 1, sibling_id += 1) }
  else
    new_x = sibling_id * DEFAULT_HORIZONTAL_OFFSET_FACTOR
    new_y = DEFAULT_VERTICAL_OFFSET_FACTOR * depth

    drawer.write(get_circle(new_x, new_y, DEFAULT_CIRCLE_RADIUS))
    drawer.write(get_text(new_x - hash.length * DEFAULT_NAME_OFFSET_FACTOR, new_y, hash))
  end
end

jsonFile = File.read(ARGV[0])
content = JSON.parse(jsonFile)

File.open(OUTPUT_FILE_NAME, "w") do |svg|
  svg.write('<svg xmlns="http://www.w3.org/2000/svg">')
  DFS(svg, content, 0, 0)
  svg.write('</svg>')
end
