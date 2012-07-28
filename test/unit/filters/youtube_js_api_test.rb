require File.expand_path('../../unit_test_helper', __FILE__)

class YouTubeJsApiTest < Test::Unit::TestCase
  
  def test_transform
    result = auto_html('http://www.youtube.com/watch?v=BwNrmYRiX_o') { youtube_js_api }
    assert_equal '<object width="390" height="250"><param name="movie" value="//www.youtube.com/v/BwNrmYRiX_o?enablejsapi=1&playerapiid=ytplayer"></param><param name="wmode" value="transparent"></param><param name="allowscriptaccess" value="always"></param><embed src="//www.youtube.com/v/BwNrmYRiX_o?enablejsapi=1&playerapiid=ytplayer" type="application/x-shockwave-flash" wmode="transparent" width="390" height="250" allowscriptaccess="always"></embed></object>', result
  end
  
  def test_transform2
    result = auto_html('http://www.youtube.com/watch?v=3-ewi9saKg8&eurl=http%3A%2F%2Fvukajlija.com%2Fvideo%2Fklipovi%3Fstrana%3D6&feature=player_embedded') { youtube_js_api }
    assert_equal '<object width="390" height="250"><param name="movie" value="//www.youtube.com/v/3-ewi9saKg8?enablejsapi=1&playerapiid=ytplayer"></param><param name="wmode" value="transparent"></param><param name="allowscriptaccess" value="always"></param><embed src="//www.youtube.com/v/3-ewi9saKg8?enablejsapi=1&playerapiid=ytplayer" type="application/x-shockwave-flash" wmode="transparent" width="390" height="250" allowscriptaccess="always"></embed></object>', result
  end
  
  def test_transform3
    result = auto_html('http://www.youtube.com/watch?v=Mw8KJ29qph0&feature=related') { youtube_js_api }
    assert_equal '<object width="390" height="250"><param name="movie" value="//www.youtube.com/v/Mw8KJ29qph0?enablejsapi=1&playerapiid=ytplayer"></param><param name="wmode" value="transparent"></param><param name="allowscriptaccess" value="always"></param><embed src="//www.youtube.com/v/Mw8KJ29qph0?enablejsapi=1&playerapiid=ytplayer" type="application/x-shockwave-flash" wmode="transparent" width="390" height="250" allowscriptaccess="always"></embed></object>', result
  end
  
  def test_transform_url_without_www
    result = auto_html('http://youtube.com/watch?v=BwNrmYRiX_o') { youtube_js_api }
    assert_equal '<object width="390" height="250"><param name="movie" value="//www.youtube.com/v/BwNrmYRiX_o?enablejsapi=1&playerapiid=ytplayer"></param><param name="wmode" value="transparent"></param><param name="allowscriptaccess" value="always"></param><embed src="//www.youtube.com/v/BwNrmYRiX_o?enablejsapi=1&playerapiid=ytplayer" type="application/x-shockwave-flash" wmode="transparent" width="390" height="250" allowscriptaccess="always"></embed></object>', result
  end

  def test_transform_with_options
    result = auto_html('http://www.youtube.com/watch?v=ZA1NoOOoaNw') { youtube_js_api(:width => 300, :height => 250) }
    assert_equal '<object width="300" height="250"><param name="movie" value="//www.youtube.com/v/ZA1NoOOoaNw?enablejsapi=1&playerapiid=ytplayer"></param><param name="wmode" value="transparent"></param><param name="allowscriptaccess" value="always"></param><embed src="//www.youtube.com/v/ZA1NoOOoaNw?enablejsapi=1&playerapiid=ytplayer" type="application/x-shockwave-flash" wmode="transparent" width="300" height="250" allowscriptaccess="always"></embed></object>', result
  end

end