require 'json'

class TreeNode
  attr_accessor :value
  attr_accessor :depth
  attr_accessor :ancestor
  attr_accessor :descendants

  def initialize(value, ancestor = nil, descendants = [])
    @value = value
    @depth = 0
    @ancestor = ancestor
    @descendants = descendants

    if(ancestor != nil)
      @depth = ancestor.depth + 1

      if(!ancestor.descendants.include?(self))
        ancestor.descendants << self
      end
    end

    if(descendants.size > 0)
      @depth = descendants.first.depth - 1
      descendants.each { |descendant| descendant.ancestor = self }
    end
  end
end

class Tree
  attr_accessor :root
  attr_accessor :current_node

  def initialize
    @root = TreeNode.new 0
    @current_node = @root
    node_1 = TreeNode.new 1, @root
    node_2 = TreeNode.new 2, @root
    node_3 = TreeNode.new 2.5, node_2
    node_4 = TreeNode.new 1.5, node_1
  end

  def generate_from_json(element, depth = 0)
    if(element.class == Hash)
      element.each do |key, value|
        generate_from_json value, depth
      end
    elsif(element.class == Array)
      element.each do |e|
        generate_from_json e, depth + 1
      end
    else
      if depth == 0
        @root = TreeNode.new element
      else

      end
    end
  end

  def print_tree(node = @root)
    puts "#{' ' * node.depth}#{node.value}"

    if node.descendants.size > 0
      node.descendants.each { |descendant| print_tree descendant }
    end
  end
end

class SVGTreeGenerator
  @STARTING_X = 200
  @STARTING_Y = 100
  @RECT_WIDTH = 100
  @RECT_HEIGHT = 50

  def initialize
    @tree = Tree.new
  end

  def generate_from_json(json)
    @tree.generate_from_json(json)
  end

  def draw
    @tree.print_tree
  end
end

def rect(x, y, w, h)
  '<rect x="' + x.to_s + \
    '" y="' + y.to_s + \
    '" width="' + w.to_s + \
    '" height="' + h.to_s + \
    '" fill="red"/>'
end

def text(x, y, str)
  '<text x="' + x.to_s + \
    '" y="' + y.to_s + \
    '" fill="black">' + str.to_s + '</text>'
end

RESULT_FILE = "A_21_Nikolay_Danailov.svg"

json_file = ARGV[0]
file = File.read json_file
json = JSON.parse file
tree_generator = SVGTreeGenerator.new
tree_generator.draw
