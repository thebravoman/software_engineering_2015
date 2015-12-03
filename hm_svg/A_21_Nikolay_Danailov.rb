require 'json'

def self.rect(x, y, w, h)
  '<rect x="' + x.to_s + \
    '" y="' + y.to_s + \
    '" width="' + w.to_s + \
    '" height="' + h.to_s + \
    '" fill="red"/>'
end

def self.text(x, y, str)
  '<text x="' + x.to_s + \
    '" y="' + y.to_s + \
    '" fill="black">' + str.to_s + '</text>'
end

class Tree
  @title = ''
  @nodes = []

  def parse_json(json)
    
  end
end

class TreeNode
  @subnodes = []
end

json_file = ARGV[0]
file = File.read json_file
json = JSON.parse file
tree = TreeMaker.parse_json json