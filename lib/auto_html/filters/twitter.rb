require 'uri'
require 'net/http'

AutoHtml.add_filter(:twitter).with({}) do |text, options|
  regex = %r{https://twitter\.com(/#!)?/[A-Za-z0-9_]{1,15}/status(es)?/\d+}

  text.gsub(regex) do |match|
    params = { :url => match }.merge(options)

    uri = URI("http://api.twitter.com/1/statuses/oembed.json")
    uri.query = URI.encode_www_form(params)

    response = JSON.parse(Net::HTTP.get(uri))
    response["html"]
  end
end
