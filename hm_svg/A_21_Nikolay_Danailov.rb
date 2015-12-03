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

    if ancestor != nil 
      @depth = ancestor.depth + 1

      if !ancestor.descendants.include?(self)
        ancestor.descendants << self
      end
    end

    if descendants.size > 0
      @depth = descendants.first.depth - 1
      descendants.each { |descendant| descendant.ancestor = self }
    end
  end
end

class Tree
  attr_accessor :root

  def initialize
    @root = nil
  end

  def generate_from_json(element, depth = 0, current_ancestor = @root, is_leaf = false)
    puts "current_ancestor: #{current_ancestor.value}" if !current_ancestor.nil?
    if element.class == Hash
      if element.values[1].class == Array
        element.each do |key, value|
          current_ancestor = generate_from_json value, depth, current_ancestor
        end
      else
        generate_from_json element.values.first, depth, current_ancestor, true
      end
    elsif element.class == Array
      element.each do |e|
        generate_from_json e, depth + 1, current_ancestor
      end
    else
      if depth == 0
        @root = TreeNode.new element
        current_ancestor = @root
      else
        current_ancestor = TreeNode.new element, current_ancestor
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
tree_generator.generate_from_json json
tree_generator.draw
