file = ARGV[0]

marks = 0
count = Hash.new
text = File.open(file, "r")

text.each_line { |line|
  words = line.downcase.split

  words.each { |word|
    marks += word.count("-_,.;:!?(){}")
    word = word.gsub(/[-_,.;:!?(){}]/, '')
    if count.has_key?(word)
      count[word] += 1
    else
      count[word] = 1
    end
  }
}

count = count.sort_by {|x, y| [-y, x]}

count.each { |x, y|
  puts "#{x},#{y}"
}

if marks > 0
  puts "\"marks\",#{marks}"
end
