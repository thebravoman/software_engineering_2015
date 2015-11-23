require 'net/http'
require 'sanitize'
require_relative 'parser'

module WordCounter
  class WebParser < Parser
    def parse(uri)
      link = URI.parse(uri)
      html = Net::HTTP.get(link)
      text = Sanitize.fragment(html)
      super(text)
    end
  end
end
