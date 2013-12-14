require 'uri'
require 'net/http'

AutoHtml.add_filter(:speakerdeck).with(:maxwidth => nil, :maxheight => nil, :link_options => {}) do |text, options|
  regex = %r{https?://speakerdeck\.com/.*/.*}

  text.gsub(regex) do |match|
    uri = URI("http://speakerdeck.com/oembed.json")
    uri.query = "url=#{match}"

    response = JSON.parse(Net::HTTP.get(uri))
    if response.present?
      response["html"].strip
    else
      match
    end
  end

end
