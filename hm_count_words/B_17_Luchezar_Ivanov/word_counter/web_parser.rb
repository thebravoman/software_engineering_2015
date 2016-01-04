require 'net/http'
require 'sanitize'
require 'openssl'

module WordCounter
  class WebpageParser < Parser
    def parse(uri)
      uri  = URI.parse(uri)
      http = Net::HTTP.new(uri.host, uri.port)

      if uri.scheme == 'https'
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      end

      result = http.get(uri.request_uri)
      text = Sanitize.fragment(result.body)

      super(text)
    end
  end
end
