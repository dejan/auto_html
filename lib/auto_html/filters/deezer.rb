module AutoHtml
  module Filters
    def auto_html_transform_deezer(url)
      if deezer_track_id = deezer_track_id(url)
        %Q|<object width="220" height="55"><param name="movie" value="http://www.deezer.com/embedded/small-widget-v2.swf?idSong=#{deezer_track_id}&colorBackground=0x555552&textColor1=0xFFFFFF&colorVolume=0x39D1FD&autoplay=0"></param><embed src="http://www.deezer.com/embedded/small-widget-v2.swf?idSong=#{deezer_track_id}&colorBackground=0x525252&textColor1=0xFFFFFF&colorVolume=0x39D1FD&autoplay=0" type="application/x-shockwave-flash" width="220" height="55"></embed></object>|
      else
        url
      end
    end

    def auto_html_match_deezer(url)
      deezer_track_id(url)
    end

  protected

    def deezer_track_id(url)
      url[/http:\/\/www.deezer.com\/track\/(\d+)/]
      $1
    end
  end
end