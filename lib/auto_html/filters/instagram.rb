require 'uri'
require 'net/http'

AutoHtml.add_filter(:instagram).with(:size => nil, :link_options => {}) do |text, options|
  regex = %r{https?:\/\/(www.)?instagr(am\.com|\.am)/p/.+}
    
  text.gsub(regex) do
    case options[:size]
    when 'large'
       dimension = 612
    when 'medium'
       dimension = 306
    when 'small'
       dimension = 150
    else
       dimension = 612
    end
    
    uri = URI("http://api.instagram.com/oembed?url=#{text}")
    response = JSON.parse(Net::HTTP.get(uri))

    image = %{<img src="#{response["url"]}" alt="#{response["title"]}" width="#{dimension}" height="#{dimension}">}
    
    if (options[:link_options][:add_link])
      if options[:link_options][:target]
        target = options[:link_options][:target]
      else
        target = "_self"
      end
       %{<a href="#{text}" title="#{response["title"]}" target="#{target}">#{image}</a>}
     else
       image
    end
  end
end
