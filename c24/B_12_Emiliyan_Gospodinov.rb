A=ARGV[0].to_i;
B=ARGV[1].to_i;
if(A > B)
	for i in (1..A)
		if((A%i == 0) and (B%i == 0))
			k = i;
		end
	end
else if(B > A)
	for i in (1..B)
		if((A%i == 0) and (B%i == 0))
			k = i;
		end
	end
end
end
if(A == B)
	k = A;
end
puts k
