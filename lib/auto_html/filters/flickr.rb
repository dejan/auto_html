AutoHtml.add_filter(:flickr).with(:maxwidth => nil, :maxheight => nil, :link_options => {}) do |text, options|
  require 'uri'
  require 'net/http'
  require 'rexml/document'

  regex = %r{http://(www\.)?flickr\.com/photos/[^\s<]*}

  text.gsub(regex) do |match|
    params = { :url => match, :format => "json" }
    [:maxwidth, :maxheight].each { |p| params[p] = options[p] unless options[p].nil? or not options[p] > 0 }

    uri = URI("http://www.flickr.com/services/oembed")
    uri.query = URI.encode_www_form(params)

    response = JSON.parse(Net::HTTP.get(uri))

    link_options = Array(options[:link_options]).reject { |k,v| v.nil? }.map { |k, v| %{#{k}="#{REXML::Text::normalize(v)}"} }.join(' ')
    %{<a href="#{match}"#{ ' ' + link_options unless link_options.empty? }><img src="#{response["url"]}" alt="#{response["title"]}" title="#{response["title"]}" /></a>}
  end
end
