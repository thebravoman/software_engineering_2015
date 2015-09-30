if ARGV[0].nil?
	raise ArgumentError, "You must provide arguments"
	exit
end

x = ARGV[0].to_i

if x < 0 || x >= 10
	raise ArgumentError, "x should be more than 0, but less than 10"
end

cosines = []
i = 0
num = 0
while(i < 10) 
	cosine = Math.cos(num)
	if (cosine * 1000).to_i % 10 == x
		cosines[i] = cosine
		puts cosine
		i += 1
	end
	
	num += 1
end
