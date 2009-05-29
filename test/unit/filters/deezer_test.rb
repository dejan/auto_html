require File.dirname(__FILE__) + '/../unit_test_helper'

class DeezerTest < Test::Unit::TestCase

  def test_transform
    result = auto_html("http://www.deezer.com/track/1053417") { deezer }
    assert_equal '<object width="220" height="55"><param name="movie" value="http://www.deezer.com/embedded/small-widget-v2.swf?idSong=1053417&colorBackground=0x555552&textColor1=0xFFFFFF&colorVolume=0x39D1FD&autoplay=0"></param><embed src="http://www.deezer.com/embedded/small-widget-v2.swf?idSong=1053417&colorBackground=0x525252&textColor1=0xFFFFFF&colorVolume=0x39D1FD&autoplay=0" type="application/x-shockwave-flash" width="220" height="55"></embed></object>', result
  end

  def test_transform2
    result = auto_html("http://www.deezer.com/track/30053") { deezer }
    assert_equal '<object width="220" height="55"><param name="movie" value="http://www.deezer.com/embedded/small-widget-v2.swf?idSong=30053&colorBackground=0x555552&textColor1=0xFFFFFF&colorVolume=0x39D1FD&autoplay=0"></param><embed src="http://www.deezer.com/embedded/small-widget-v2.swf?idSong=30053&colorBackground=0x525252&textColor1=0xFFFFFF&colorVolume=0x39D1FD&autoplay=0" type="application/x-shockwave-flash" width="220" height="55"></embed></object>', result
  end

end
