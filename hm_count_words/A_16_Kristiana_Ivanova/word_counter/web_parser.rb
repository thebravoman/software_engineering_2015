require_relative 'parser.rb'
require 'net/http'
require 'openssl'
require 'sanitize'

module WordCounter
  class WebParser < Parser
    def parse(uri)
      uri = URI.parse(uri)
      http = Net::HTTP.new(uri.host, uri.port)

      if uri.scheme == 'https'
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      end

      res = http.get(uri.request_uri)
      string = Sanitize.clean(res.body, remove_contents: %w(script, style))
      super (string)
    end
  end
end