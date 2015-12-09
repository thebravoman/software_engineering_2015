require_relative 'tree/tree.rb'
require_relative 'svg_drawer.rb'

# Generator an SVG graphic tree
class SVGTreeGenerator
  private

  SCREEN_WIDTH = 1000
  STARTING_Y = 75
  RECT_WIDTH = 100
  RECT_HEIGHT = 50
  CIRCLE_RADIUS = 50
  Y_BETWEEN_ELEMENTS = 125

  def draw(ancestor_x = nil, ancestor_y = nil, node = @tree.root)
    drawer = SVGDrawer.new
    siblings_size = 1

    if node != @tree.root
      siblings_size = node.ancestor.descendants.size
    end

    ancestor_level_elements = tree.get_elements { |n| n.depth == node.depth - 1 }.size
    alotted_space = SCREEN_WIDTH

    unless ancestor_level_elements == 0
      alotted_space /= (ancestor_level_elements)
    end

    ancestor_index = 0
    ancestor_index = node.ancestor.index unless node.ancestor.nil?

    x_per_element = alotted_space / (siblings_size + 1)
    element_x = ancestor_index * alotted_space + x_per_element * (node.index + 1)
    element_y = STARTING_Y + Y_BETWEEN_ELEMENTS * node.depth
    same_depth_elements = tree.get_elements { |n| n.depth == node.depth }
    size_coeficient = 1

    if node.leaf?
      if !ancestor_x.nil? && !ancestor_y.nil?
        @result += drawer.line element_x + RECT_WIDTH / 2, element_y, ancestor_x, ancestor_y
      end

      @result += drawer.rect element_x, element_y, RECT_WIDTH * size_coeficient, RECT_HEIGHT * size_coeficient
      @result += drawer.text element_x + RECT_WIDTH / 2, element_y + RECT_HEIGHT / 2, node.value
    else
      if !ancestor_x.nil? && !ancestor_y.nil?
        @result += drawer.line element_x, element_y, ancestor_x, ancestor_y
      end

      @result += drawer.circle element_x, element_y, CIRCLE_RADIUS * size_coeficient
      @result += drawer.text element_x, element_y, node.value
    end

    node.descendants.each do |desc|
      draw element_x, element_y, desc
    end
  end

  public

  attr_accessor :tree

  def initialize
    @tree = Tree.new
    @result = ''
  end

  def generate_from_json(json)
    @tree.generate_from_json(json)
    @result += '<svg xmlns="http://www.w3.org/2000/svg">'
    draw
    @result += '</svg>'
    @result
  end
end
