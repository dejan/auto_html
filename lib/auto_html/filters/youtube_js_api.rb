AutoHtml.add_filter(:youtube_js_api).with(:width => 390, :height => 250) do |text, options|
  text.gsub(/https?:\/\/(www.)?youtube\.com\/watch\?v=([A-Za-z0-9._%-]*)(\&\S+)?/) do
    youtube_id = $2
    %{<object width="#{options[:width]}" height="#{options[:height]}"><param name="movie" value="//www.youtube.com/v/#{youtube_id}?enablejsapi=1&playerapiid=ytplayer"></param><param name="wmode" value="transparent"></param><param name="allowscriptaccess" value="always"></param><embed src="//www.youtube.com/v/#{youtube_id}?enablejsapi=1&playerapiid=ytplayer" type="application/x-shockwave-flash" wmode="transparent" width="#{options[:width]}" height="#{options[:height]}" allowscriptaccess="always"></embed></object>}
  end
end