require 'net/http'
require 'sanitize'
require 'openssl'
require_relative 'result'
require_relative 'parser'

module WordCounter
  class WebpageParser
    def parse_url(uri)
      uri  = URI.parse(ARGV[0])

      http = Net::HTTP.new(uri.host, uri.port)

    if uri.scheme == 'https'
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    end

    result = http.get(uri.request_uri)

    string = Sanitize.fragment(result.body)
    Parser.new.parse string
    end
  end
end
