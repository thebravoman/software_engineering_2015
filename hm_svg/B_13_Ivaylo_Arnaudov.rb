require 'json'
require 'pp'

ROOT_NODE_INDENT = 300
ROOT_NODE_OFFSET = 300
INITIAL_DEPTH = 30
CIRCLE_RADIUS = 30

file_path = ARGV[0]
contents = File.read(file_path)
root = JSON.parse(contents)

def parse(node, file, c_indent, c_offset, depth)
  root = node[node.keys.first]
  children = node[node.keys.last]

  if children == root
    file.puts "<rect fill='lightblue' x='#{c_indent}' y='#{depth}' width='#{1.25 * c_offset}' height='50' />"
    file.puts "<text x='#{c_indent}' y='#{depth + 25}' font-size='13px'" +
      " fill='black'>#{root}</text>"
    return
  else
    file.puts "<circle cx='#{c_indent}' cy='#{depth}' r='#{CIRCLE_RADIUS}'" +
                " fill='lightblue' />"
    file.puts "<text x='#{c_indent - CIRCLE_RADIUS}' y='#{depth}'" +
                " font-size='13px' fill='black'>#{root}</text>"
  end


  new_indent = c_indent - (ROOT_NODE_INDENT / 2)
  new_offset = c_offset / children.length
  children.each do |child|
    file.puts "<line x1='#{new_indent}' y1='#{depth + 100}' x2='#{c_indent}' y2='#{depth}' style='stroke:rgb(0,0,0);stroke-width:2' />"
    parse(child, file, new_indent, new_offset, depth + 100)
    new_indent += 2* new_offset
  end
end

def generate_svg(root)
  File.open("B_13_Ivaylo_Arnaudov.svg", "w") do |file|
    file.puts "<?xml version='1.0'?>"
    file.puts "<svg width='1000' height='1000'" +
                " xmlns='http://www.w3.org/2000/svg'>"
    parse(root, file, ROOT_NODE_INDENT, ROOT_NODE_OFFSET, INITIAL_DEPTH)
    file.puts "<text x='300' y='500' font-size='15px' fill='black'>I know it sucks, but recursive DFS traversal + SVG was a painful combination</text>"
    file.puts "</svg>"
  end
end

generate_svg(root)
