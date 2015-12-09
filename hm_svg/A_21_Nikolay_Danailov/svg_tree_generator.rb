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
    @result += '<svg xmlns="http://www.w3.org/2000/svg">'

    drawer = SVGDrawer.new
    same_depth_elements = tree.get_elements_with_depth node.depth
    node_index = 0

    if node != @tree.root
      node_index = Hash[same_depth_elements.map.with_index.to_a][node]
    end

    alotted_space = SCREEN_WIDTH / (same_depth_elements.size + 1)
    element_x = alotted_space * (node_index + 1)
    element_y = STARTING_Y + Y_BETWEEN_ELEMENTS * node.depth

    if node.leaf?
      if !ancestor_x.nil? && !ancestor_y.nil?
        @result += drawer.line element_x + RECT_WIDTH / 2, element_y, ancestor_x, ancestor_y
      end

      @result += drawer.rect element_x, element_y, RECT_WIDTH, RECT_HEIGHT
      @result += drawer.text element_x + RECT_WIDTH / 2, element_y + RECT_HEIGHT / 2, node.value
    else
      if !ancestor_x.nil? && !ancestor_y.nil?
        @result += drawer.line element_x, element_y, ancestor_x, ancestor_y
      end

      @result += drawer.circle element_x, element_y, CIRCLE_RADIUS
      @result += drawer.text element_x, element_y, node.value
    end

    node.descendants.each do |desc|
      draw element_x, element_y, desc
    end

    @result += '</svg>'
  end

  public

  attr_accessor :tree

  def initialize
    @tree = Tree.new
    @result = ''
  end

  def generate_from_json(json)
    @tree.generate_from_json(json)
    draw
    @result
  end
end
