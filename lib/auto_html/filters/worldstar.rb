AutoHtml.add_filter(:worldstar).with(:width => 448, :height => 374) do |text,options|
    text.gsub(/http:\/\/www\.worldstarhiphop\.com\/videos\/video\.php\?v\=(wshh[A-Za-z0-9]+)/) do 
      video_id = $1
      width  = options[:width]
      height = options[:height]
      %{<object width="#{width}" height="#{height}"><param name="movie" value="http://www.worldstarhiphop.com/videos/e/16711680/#{video_id}"><param name="allowFullScreen" value="true"></param><embed src="http://www.worldstarhiphop.com/videos/e/16711680/#{video_id}" type="application/x-shockwave-flash" allowFullscreen="true" width="#{width}" height="#{height}"></embed></object>}
    end
end