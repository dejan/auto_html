require 'uri'
require 'net/http'

AutoHtml.add_filter(:instagram).with(:width => 710, :height => 612) do |text|
  text << '/' unless text.end_with?('/')
  width = options[:width]
  height = options[:height]
  regex = %r{https?:\/\/(www.)?instagr(am\.com|\.am)/p/.+}
  text.gsub(regex) do
    %{<iframe src="#{text}embed" height="#{width}" width="#{height}" frameborder="0" scrolling="no"></iframe>}
  end
end