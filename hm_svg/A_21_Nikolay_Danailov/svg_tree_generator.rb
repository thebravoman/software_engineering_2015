require_relative 'tree/tree.rb'

class SVGTreeGenerator
  @STARTING_X = 200
  @STARTING_Y = 100
  @RECT_WIDTH = 100
  @RECT_HEIGHT = 50

  attr_accessor :tree

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