filename = "file.txt"

text = String.new

File.open(filename) { |f| text = f.read }
words = text.split(/[^a-zA-Z]/)
freqs = Hash.new(0)

words.each { |word| freqs[word] += 1 }
freqs = freqs.sort_by {|x,y| y }
freqs.reverse!
freqs.each {|word, freq| puts word+','+freq.to_s}