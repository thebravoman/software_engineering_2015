require 'net/http'
require 'sanitize'

module WordCounter
  class WebParser < Parser
    def parse(url)
      html = Net::HTTP.get(URI.parse(url))
      sanitized = Sanitize.fragment(html)
      super(sanitized)
    end
  end
end
