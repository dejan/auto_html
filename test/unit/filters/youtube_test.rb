require File.dirname(__FILE__) + '/../unit_test_helper'

class YouTubeTest < Test::Unit::TestCase

  def test_transform
    result = auto_html('http://www.youtube.com/watch?v=BwNrmYRiX_o') { youtube }
    assert_equal '<object width="390" height="250"><param name="movie" value="http://www.youtube.com/v/BwNrmYRiX_o"></param><param name="wmode" value="transparent"></param><embed src="http://www.youtube.com/v/BwNrmYRiX_o" type="application/x-shockwave-flash" wmode="transparent" width="390" height="250"></embed></object>', result
  end

  def test_transform2
    result = auto_html('http://www.youtube.com/watch?v=3-ewi9saKg8&eurl=http%3A%2F%2Fvukajlija.com%2Fvideo%2Fklipovi%3Fstrana%3D6&feature=player_embedded') { youtube }
    assert_equal '<object width="390" height="250"><param name="movie" value="http://www.youtube.com/v/3-ewi9saKg8"></param><param name="wmode" value="transparent"></param><embed src="http://www.youtube.com/v/3-ewi9saKg8" type="application/x-shockwave-flash" wmode="transparent" width="390" height="250"></embed></object>', result
  end

  def test_transform3
    result = auto_html('http://www.youtube.com/watch?v=Mw8KJ29qph0&feature=related') { youtube }
    assert_equal '<object width="390" height="250"><param name="movie" value="http://www.youtube.com/v/Mw8KJ29qph0"></param><param name="wmode" value="transparent"></param><embed src="http://www.youtube.com/v/Mw8KJ29qph0" type="application/x-shockwave-flash" wmode="transparent" width="390" height="250"></embed></object>', result
  end

  def test_transform_url_without_www
    result = auto_html('http://youtube.com/watch?v=BwNrmYRiX_o') { youtube }
    assert_equal '<object width="390" height="250"><param name="movie" value="http://www.youtube.com/v/BwNrmYRiX_o"></param><param name="wmode" value="transparent"></param><embed src="http://www.youtube.com/v/BwNrmYRiX_o" type="application/x-shockwave-flash" wmode="transparent" width="390" height="250"></embed></object>', result
  end

  def test_transform_with_options
    result = auto_html('http://www.youtube.com/watch?v=ZA1NoOOoaNw') { youtube(:width => 300, :height => 250) }
    assert_equal '<object width="300" height="250"><param name="movie" value="http://www.youtube.com/v/ZA1NoOOoaNw"></param><param name="wmode" value="transparent"></param><embed src="http://www.youtube.com/v/ZA1NoOOoaNw" type="application/x-shockwave-flash" wmode="transparent" width="300" height="250"></embed></object>', result
  end

end