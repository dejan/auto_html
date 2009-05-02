AutoHtml.add_filter(:google_video).with(:width => 650, :height => 391) do |text, options|
  text.gsub(/http:\/\/video\.google\.com\/videoplay\?docid\=(-?[0-9]*)[&\w;=\+_\-]*/) do
    docid = $1
    %{<object width="#{options[:width]}" height="#{options[:height]}"><param name="movie" value="http://video.google.com/googleplayer.swf?docid=#{docid}&hl=en&fs=true"></param><param name="wmode" value="transparent"></param><embed src="http://video.google.com/googleplayer.swf?docid=#{docid}" type="application/x-shockwave-flash" wmode="transparent" width="#{options[:width]}" height="#{options[:height]}"></embed></object>}
  end
end