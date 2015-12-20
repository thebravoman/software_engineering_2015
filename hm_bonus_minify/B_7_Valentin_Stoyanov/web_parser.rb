require 'csv'

def web_parse input
	uri  = URI.parse(input)
	http = Net::HTTP.new(uri.host, uri.port)

	if uri.scheme == 'https'
		http.use_ssl = true
		http.verify_mode = OpenSSL::SSL::VERIFY_NONE
	end

	result = http.get(uri.request_uri)
	res = Sanitize.fragment(result.body)
	CSV.parse(res) {|line| @my_csv.push(line)}
end
