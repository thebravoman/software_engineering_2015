require 'csv'

folder1 = ARGV[0]
folder2 = ARGV[1]

names = []
names2 = []
namesboth = []

i=0
k=0

Dir.glob("folder1" + "*").each do |filename|
	file = filename.split('/').last.split('.').first;
		if filename.split('_')[0].length == 5
			names[i] = file.split('_')[0]
			i++
		end
end

Dir.glob("folder2" + "*").each do |files|
	filez = files.split('/').last.split('.').first;
		if files.split('_')[0].length == 5
			names[k] = filez.split('_')[0]
			k++
		end
end

