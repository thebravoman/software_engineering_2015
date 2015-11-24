require 'net/http'
require 'sanitize'
require 'openssl'

module Word_counter
  class WebParser < Parser
    def parse(url)
      uri = URI.parse(url)
      http = Net::HTTP.new(uri.host, uri.port)

      if uri.scheme == 'https'
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      end

      result = http.get(uri.request_uri)
      result = Sanitize.fragment(result.body)

      super(result)
    end
  end
end
