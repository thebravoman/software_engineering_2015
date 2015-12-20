class SVGDrawer
    POSITION_BY_X = 25
    POSITION_BY_Y = 28
    POSITION_OF_ENDING_DOT = 100
  def rectangle x_pos, y_pos, text

    '<rect x = "'+x_pos.to_s+'" y = "'+y_pos.to_s+'" width="100" height="50" style=" fill:rgb(51,255,51);stroke-width:1.5;stroke:rgb(0,0,0)" />
    <text x="'+(x_pos + POSITION_BY_X).to_s+'" y="'+(y_pos + POSITION_BY_Y).to_s+'"  width = "25" height = "25" fill="black">'+text.to_s+'</text>'
  end

  def circle x_pos, y_pos,text
    '<circle cx="'+x_pos.to_s+'" cy="'+y_pos.to_s+'" r="60" stroke="black" stroke-width="1.5" fill="brown" />
    <text x="'+(x_pos - POSITION_BY_X).to_s+'" y="'+y_pos.to_s+'"  width = "25" height = "25" fill="black">'+text.to_s+'</text>'
  end

  def line_to_circle x_pos, y_pos
    '<line x1="'+(x_pos + POSITION_BY_Y).to_s+'" y1="'+(y_pos + POSITION_BY_Y).to_s+'" x2="'+(x_pos + POSITION_OF_ENDING_DOT).to_s+'" y2="'+(y_pos + POSITION_OF_ENDING_DOT).to_s+'" style="stroke:rgb(255,0,0);stroke-width:2" />'
  end

  def line_to_rectangle x_pos, y_pos
      '<line x1="'+(x_pos + POSITION_BY_Y).to_s+'" y1="'+(y_pos - POSITION_BY_Y).to_s+'" x2="'+(x_pos + POSITION_OF_ENDING_DOT).to_s+'" y2="'+y_pos.to_s+'" style="stroke:rgb(255,0,0);stroke-width:2" />'
  end
end
