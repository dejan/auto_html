require 'uri'
require 'net/http'

AutoHtml.add_filter(:instagram).with(:width => 616, :height => 714, :frameborder => 0) do |text, options|
  regex = %r{((https?:\/\/)?(www.)?instagr(am\.com|\.am)/p/[a-zA-Z0-9_-]+)[^\s]*}
  text.gsub(regex) do
  	url = $1
  	url = "http://#{url}" if $2.nil?
    %{<iframe src="#{url}/embed" height="#{options[:height]}" width="#{options[:width]}" frameborder="#{options[:frameborder]}" scrolling="no"></iframe>}
  end
end