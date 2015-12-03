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

  def line(x1, y1, x2, y2)
    '<line x1="' + x1.to_s + '" y1="' + y1.to_s + '" x2="' + x2.to_s + '" y2="' + y2.to_s + '" style="stroke:rgb(255,0,0);stroke-width:2" />'
  end

  def draw(ancestor_x = nil, ancestor_y = nil, node = @tree.root)
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

    if(!ancestor_x.nil? && !ancestor_y.nil?)
      @result += line rect_x + @RECT_WIDTH / 2, rect_y, ancestor_x + @RECT_WIDTH / 2, ancestor_y + @RECT_HEIGHT
    end

    node.descendants.each do |desc|
      draw rect_x, rect_y, desc
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
    draw
    @result
  end
end