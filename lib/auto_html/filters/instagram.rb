require 'uri'
require 'net/http'

AutoHtml.add_filter(:instagram).with(:width => 616, :height => 714) do |text, options|
  text << '/' unless text.end_with?('/')
  width = options[:width]
  height = options[:height]
  regex = %r{https?:\/\/(www.)?instagr(am\.com|\.am)/p/.+}
  text.gsub(regex) do
    %{<iframe src="#{text}embed" height="#{height}" width="#{width}" frameborder="0" scrolling="no"></iframe>}
  end
end