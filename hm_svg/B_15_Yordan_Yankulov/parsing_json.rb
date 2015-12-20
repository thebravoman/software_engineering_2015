def parsing file, set
  file.each do |key, value|
    puts ' '*set + key
    if value.is_a? String or value.is_a? Numeric
      puts " "*(set+4) + value.to_s
    else
      value.each do |val|
        parsing(val,set + 2)
      end
    end
  end
end
