module AutoHtml
  module Filters
    def auto_html_transform_youtube(url)
      youtube_track_id = youtube_track_id(url)
      youtube_track_id && youtube_player(youtube_track_id)
    end
    
    def auto_html_match_youtube(url)
      youtube_track_id(url)
    end

  protected

    def youtube_track_id(url)
      url[/youtube\.com\/watch\?v=([^&]+)/ie]
      $1
    end

    def youtube_player(youtube_id, width=390, height=250)
      %{<object width="#{width}" height="#{height}"><param name="movie" value="http://www.youtube.com/v/#{youtube_id}"></param><param name="wmode" value="transparent"></param><embed src="http://www.youtube.com/v/#{youtube_id}" type="application/x-shockwave-flash" wmode="transparent" width="#{width}" height="#{height}"></embed></object>}
    end
  end
end