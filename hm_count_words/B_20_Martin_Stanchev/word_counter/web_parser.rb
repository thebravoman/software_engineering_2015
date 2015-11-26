require 'net/http'
require 'sanitize'
require 'openssl'

module WordCounter
  class WebpageParser < Parser
    def parse(uri)
      uri = URI.parse(ARGV[0])
      http = Net::HTTP.new(uri.host, uri.port)

      if uri.scheme = 'https'
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      end

      text = http.get(uri.request_uri)
      content = Sanitize.fragment(text.body)
   
      super(content)
    end
  end
end