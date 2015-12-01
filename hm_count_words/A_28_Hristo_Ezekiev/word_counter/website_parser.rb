require 'word_counter/parser'
require 'net/http'
require 'sanitize'
require 'openssl'

module WordCounter
  class WebsiteParser < Parser
    def parse(uri)
      uri = URI.parse(ARGV.first)
      http = Net::HTTP.new(uri.host, uri.port)

			if uri.scheme == 'https'
				http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE
			end

      contents = http.get(uri.request_uri)
      contents = Sanitize.fragment(contents.body)
      super contents
    end
  end
end
