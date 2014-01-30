require 'uri'
require 'net/http'

AutoHtml.add_filter(:instagram) do |text|
  text << '/' unless text.end_with?('/')
  regex = %r{https?:\/\/(www.)?instagr(am\.com|\.am)/p/.+}
  text.gsub(regex) do
    image = URI("#{text}embed/")
  end
end