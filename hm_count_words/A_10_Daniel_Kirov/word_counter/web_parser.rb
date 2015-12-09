require_relative 'parser.rb'
require 'net/http'
require 'sanitize'
require 'openssl'

module WordCounter
  class WebParser < Parser
    def parse(uri)
      uri = URI.parse(uri)
      http = Net::HTTP.new(uri.host, uri.port)
      if uri.scheme == 'https'
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      end
      result = http.get(uri.request_uri)
      string = Sanitize.clean(result.body, :remove_contents => ['script', 'style'])
      super (string)
    end
  end
end
