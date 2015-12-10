require_relative 'drawer'
def drawing_the_svg file, checker, drawer, string, way, number_of_branches, number_of_leaves
  default_x = 1000 - way
  default_y = 65 + way
  file.each do |key, value|
    if checker == 0
      string = drawer.circle default_x, default_y, value
    end
    puts value
    if ((value.kind_of? String or value.kind_of? Numeric) and (checker != 0)) and number_of_branches != 0
        string.concat(drawer.circle default_x , default_y, value)
        string.concat(drawer.line_to_circle default_x , default_y )
      number_of_branches = number_of_branches - 1
    end
    if checker == 0
      checker = 1
    end
    if number_of_leaves != 0 && number_of_branches == 0
      string.concat(drawer.rectangle default_x, default_y, value.to_s)
    end
    if number_of_branches == 0 and !value.kind_of? String
      number_of_leaves = 1 + number_of_leaves
    end
    if !value.kind_of? String and checker != 0
      number_of_branches = number_of_branches + 1
      value.each do |val|
        drawing_the_svg(val,1,drawer,string,way = way + 100,number_of_branches,number_of_leaves)
      end
    end
  end
  return string
end
