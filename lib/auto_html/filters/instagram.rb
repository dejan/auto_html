require 'uri'
require 'net/http'

AutoHtml.add_filter(:instagram) do |text|
  regex = %r{(^|\s|>)https?:\/\/(www.)?instagr(am\.com|\.am)/p/.+($|\s|<)}
  text.gsub(regex) do |match|
    match << '/' unless match.end_with?('/')
    %{<iframe src="#{match}embed" height="714" width="616" frameborder="0" scrolling="no"></iframe>}
  end
end