def get_dev n
	for i in 1..n
		if n % i == 0
			puts i
		end
	end
end
def get_gcd n,m
	max = 0
	for i in 1.. n
		if n % i == 0 && m % i == 0
			max = i
		end
	end
	puts max
end

p = 17
q = 23
n = 391
fn = 352
get_dev fn
get_gcd 1,352
