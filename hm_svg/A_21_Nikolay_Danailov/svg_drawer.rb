class SVGDrawer
  def rect(x, y, w, h)
    '<rect x="' + x.to_s + \
      '" y="' + y.to_s + \
      '" width="' + w.to_s + \
      '" height="' + h.to_s + \
      '" fill="red"/>'
  end

  def text(x, y, str)
    '<text text-anchor="middle" x="' + x.to_s + \
      '" y="' + y.to_s + \
      '" fill="black">' + str.to_s + '</text>'
  end

  def line(x1, y1, x2, y2)
    '<line x1="' + x1.to_s + '" y1="' + y1.to_s + '" x2="' + x2.to_s + '" y2="' + y2.to_s + '" style="stroke:rgb(255,0,0);stroke-width:2" />'
  end

  def circle x, y, r
    '<circle cx="' + x.to_s + '" cy="' + y.to_s + '" r="' + r.to_s + '" stroke="black" fill="red" />'
  end
end