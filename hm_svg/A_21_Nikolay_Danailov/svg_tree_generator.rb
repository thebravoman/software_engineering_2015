require_relative 'tree/tree.rb'

class SVGTreeGenerator
  private

  @SCREEN_WIDTH
  @STARTING_Y
  @RECT_WIDTH
  @RECT_HEIGHT

  @result

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

  def draw_rectangles(node = @tree.root)
    same_depth_elements = tree.get_elements_with_depth node.depth
    node_index = 0

    if node != @tree.root
      node_index = Hash[same_depth_elements.map.with_index.to_a][node]
    end

    alotted_space = @SCREEN_WIDTH / (same_depth_elements.size + 1)
    rect_x = alotted_space * (node_index + 1)

    rect_y = @STARTING_Y * (node.depth + 1)
    @result += rect rect_x, rect_y, @RECT_WIDTH, @RECT_HEIGHT
    @result += text rect_x + 30, rect_y + 30, node.value

    node.descendants.each do |desc|
      draw_rectangles desc
    end
  end

  public

  attr_accessor :tree

  def initialize
    @tree = Tree.new
    @result = ''

    @SCREEN_WIDTH = 1000
    @STARTING_Y = 100
    @RECT_WIDTH = 100
    @RECT_HEIGHT = 50
  end

  def generate_from_json(json)
    @tree.generate_from_json(json)
    draw_rectangles
    draw_lines
    @result
  end
end