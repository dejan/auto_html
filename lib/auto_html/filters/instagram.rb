require 'uri'
require 'net/http'

AutoHtml.add_filter(:instagram) do |text|
  regex = %r{https?:\/\/(www.)?instagr(am\.com|\.am)/p/.+}
  
  text.gsub(regex) do
    uri = URI("#{text}embed/")
    image = Net::HTTP.get(uri)
  end
end
