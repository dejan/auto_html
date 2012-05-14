require 'uri'
require 'net/http'

AutoHtml.add_filter(:soundcloud).with(:maxwidth => '100%', :maxheight => '166', :auto_play => false, :show_comments => true) do |text, options|
  text.gsub(/^(https?):\/\/(www.)?soundcloud\.com\/.*/) do |match|
    uri = URI("http://soundcloud.com/oembed")
    params = {:format => 'json', :url => match}
    params = params.merge options
    uri.query = URI.encode_www_form(params)
    response = Net::HTTP.get(uri)

    if !response.blank?
      JSON.parse(response)["html"]
    else
      match
    end
  end
end