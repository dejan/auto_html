AutoHtml.register_filter(:youtube, /http:\/\/www.youtube\.com\/watch\?v=([^&]+)/ie) do |match|
  match[/http:\/\/www.youtube\.com\/watch\?v=([^&]+)/ie]
  youtube_id = $1

  width  = 390
  height = 250

  %{<object width="#{width}" height="#{height}"><param name="movie" value="http://www.youtube.com/v/#{youtube_id}"></param><param name="wmode" value="transparent"></param><embed src="http://www.youtube.com/v/#{youtube_id}" type="application/x-shockwave-flash" wmode="transparent" width="#{width}" height="#{height}"></embed></object>}
end
