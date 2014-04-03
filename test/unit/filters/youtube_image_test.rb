require File.expand_path('../../unit_test_helper', __FILE__)

class YouTubeImageTest < Test::Unit::TestCase

  def test_transform
    result = auto_html('http://www.youtube.com/watch?v=BwNrmYRiX_o') { youtube_image }
    assert_equal '<div class="thumbnail youtube"><a href="https://www.youtube.com/watch?v=BwNrmYRiX_o" target="_blank"><img src="//img.youtube.com/vi/BwNrmYRiX_o/mqdefault.jpg" width="320" height="315" border="0"></a></div>', result
  end

  def test_transform2
    result = auto_html('http://www.youtube.com/watch?v=BwNrmYRiX_o&eurl=http%3A%2F%2Fvukajlija.com%2Fvideo%2Fklipovi%3Fstrana%3D6&feature=player_embedded') { youtube_image }
    assert_equal '<div class="thumbnail youtube"><a href="https://www.youtube.com/watch?v=BwNrmYRiX_o" target="_blank"><img src="//img.youtube.com/vi/BwNrmYRiX_o/mqdefault.jpg" width="320" height="315" border="0"></a></div>', result
  end

  def test_transform3
    result = auto_html('http://www.youtube.com/watch?v=BwNrmYRiX_o&feature=related') { youtube_image }
    assert_equal '<div class="thumbnail youtube"><a href="https://www.youtube.com/watch?v=BwNrmYRiX_o" target="_blank"><img src="//img.youtube.com/vi/BwNrmYRiX_o/mqdefault.jpg" width="320" height="315" border="0"></a></div>', result
  end

  def test_transform3
    result = auto_html('foo http://www.youtube.com/watch?v=fT1ahr81HLw bar') { youtube_image }
    assert_equal 'foo <div class="thumbnail youtube"><a href="https://www.youtube.com/watch?v=fT1ahr81HLw" target="_blank"><img src="//img.youtube.com/vi/fT1ahr81HLw/mqdefault.jpg" width="320" height="315" border="0"></a></div> bar', result
  end

  def test_transform4
    result = auto_html('foo http://www.youtube.com/watch?v=fT1ahr81HLw<br>bar') { youtube_image }
    assert_equal 'foo <div class="thumbnail youtube"><a href="https://www.youtube.com/watch?v=fT1ahr81HLw" target="_blank"><img src="//img.youtube.com/vi/fT1ahr81HLw/mqdefault.jpg" width="320" height="315" border="0"></a></div><br>bar', result
  end

  def test_transform_url_without_www
    result = auto_html('http://youtube.com/watch?v=BwNrmYRiX_o') { youtube_image }
    assert_equal '<div class="thumbnail youtube"><a href="https://www.youtube.com/watch?v=BwNrmYRiX_o" target="_blank"><img src="//img.youtube.com/vi/BwNrmYRiX_o/mqdefault.jpg" width="320" height="315" border="0"></a></div>', result
  end

  def test_transform_with_options
    result = auto_html('http://www.youtube.com/watch?v=BwNrmYRiX_o') { youtube_image(:width => 300, :height => 255, :style => 'high', :target => 'self', :border => 1) }
    assert_equal '<div class="thumbnail youtube"><a href="https://www.youtube.com/watch?v=BwNrmYRiX_o" target="_self"><img src="//img.youtube.com/vi/BwNrmYRiX_o/hqdefault.jpg" width="300" height="255" border="1"></a></div>', result
  end

  def test_transform_with_short_url
    result = auto_html('http://www.youtu.be/BwNrmYRiX_o') { youtube_image }
    assert_equal '<div class="thumbnail youtube"><a href="https://www.youtube.com/watch?v=BwNrmYRiX_o" target="_blank"><img src="//img.youtube.com/vi/BwNrmYRiX_o/mqdefault.jpg" width="320" height="315" border="0"></a></div>', result
  end

  def test_transform_https
    result = auto_html("https://www.youtube.com/watch?v=t7NdBIA4zJg") { youtube_image }
    assert_equal '<div class="thumbnail youtube"><a href="https://www.youtube.com/watch?v=t7NdBIA4zJg" target="_blank"><img src="//img.youtube.com/vi/t7NdBIA4zJg/mqdefault.jpg" width="320" height="315" border="0"></a></div>', result
  end

  def test_short_with_params
    result = auto_html("http://youtu.be/t7NdBIA4zJg?t=1s&hd=1") { youtube_image }
    assert_equal '<div class="thumbnail youtube"><a href="https://www.youtube.com/watch?v=t7NdBIA4zJg" target="_blank"><img src="//img.youtube.com/vi/t7NdBIA4zJg/mqdefault.jpg" width="320" height="315" border="0"></a></div>', result
  end

  def test_transform_without_protocol
    result = auto_html("www.youtube.com/watch?v=t7NdBIA4zJg") { youtube_image }
    assert_equal '<div class="thumbnail youtube"><a href="https://www.youtube.com/watch?v=t7NdBIA4zJg" target="_blank"><img src="//img.youtube.com/vi/t7NdBIA4zJg/mqdefault.jpg" width="320" height="315" border="0"></a></div>', result
  end
end
