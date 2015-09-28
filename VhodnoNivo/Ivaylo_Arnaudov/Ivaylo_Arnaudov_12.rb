def count_full_tiles(x, y, w, h)
  big_tile_area = x * y
  small_tile_area = w * h
  big_tile_area / small_tile_area
end


x = ARGV[0].to_i
y = ARGV[1].to_i
w = ARGV[2].to_i
h = ARGV[3].to_i

if x > 0 && y > 0 && w > 0 && h > 0
  puts count_full_tiles(x, y, w, h)

  width_cutting_coords = Array.new
  current_width = w

  loop do
    # adding up the next small tile width exceeds the big tile width
    if current_width >= x
      break
    end

    width_cutting_coords.push(current_width)
    current_width += w
  end

  puts "#{width_cutting_coords}"
else
  raise "Arguments should be in the range x > 0; y > 0; w > 0; h > 0"
end
