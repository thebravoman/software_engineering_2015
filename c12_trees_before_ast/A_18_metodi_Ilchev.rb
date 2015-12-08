require 'JSON'

jason=File.read("A_18_Metodi_Ilchev.json")
ayy=JSON.parse(jason)
puts
def readarr(arr)
arr.each{|v|
	if v.kind_of? (Array) or v.kind_of?(Hash)
		readarr(v)
	else
		puts "value is #{v.class}; #{v}"
	end
}
end

readarr(ayy)
