file = File.open(ARGV.first, "r")

contents = ""
contents = file.read.downcase
marks = contents.gsub(/[a-z\s]/, "");
words = contents.gsub(/[^a-z'\s-]/, "").split

hash = Hash.new(0)

words.each do |word|
	hash[word] += 1
end

hash = hash.sort_by{|word, count| [-count, word]}

hash.each do |word, count|
	puts word + "," + count.to_s
end

if marks.length > 0
	puts '"marks",' + marks.length.to_s
end
