AutoHtml.add_filter(:deezer) do |text|
  text.gsub(/http:\/\/www.deezer.com\/track\/(\d+)/) do
    deezer_track_id = $1
    %Q|<object width="220" height="55"><param name="movie" value="http://www.deezer.com/embedded/small-widget-v2.swf?idSong=#{deezer_track_id}&colorBackground=0x555552&textColor1=0xFFFFFF&colorVolume=0x39D1FD&autoplay=0"></param><embed src="http://www.deezer.com/embedded/small-widget-v2.swf?idSong=#{deezer_track_id}&colorBackground=0x525252&textColor1=0xFFFFFF&colorVolume=0x39D1FD&autoplay=0" type="application/x-shockwave-flash" width="220" height="55"></embed></object>|
  end
end