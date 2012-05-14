require 'uri'
require 'net/http'

AutoHtml.add_filter(:soundcloud).with({}) do |text, options|
  text.gsub(/(https?):\/\/(www.)?soundcloud\.com\/.*/) do
    uri = URI("http://soundcloud.com/oembed")
    uri.query = URI.encode_www_form({:format => 'json', :url => text})
    response = JSON.parse(Net::HTTP.get(uri))
    response["html"]
  end
end