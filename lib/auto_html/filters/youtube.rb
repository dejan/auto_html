AutoHtml.add_filter(:youtube).with(:width => 390, :height => 250) do |text, options|
  text.gsub(/http:\/\/(www.)?youtube\.com\/watch\?v=([A-Za-z0-9._%-]*)(\&\S+)?/) do
    youtube_id = $2
    %{<object width="#{options[:width]}" height="#{options[:height]}"><param name="movie" value="http://www.youtube.com/v/#{youtube_id}"></param><param name="wmode" value="transparent"></param><embed src="http://www.youtube.com/v/#{youtube_id}" type="application/x-shockwave-flash" wmode="transparent" width="#{options[:width]}" height="#{options[:height]}"></embed></object>}
  end
end