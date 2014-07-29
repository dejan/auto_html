require File.expand_path('../../unit_test_helper', __FILE__)

class YouTubeTest < Test::Unit::TestCase

  def test_transform
    result = auto_html('http://www.youtube.com/watch?v=BwNrmYRiX_o') { youtube }
    assert_equal '<div class="video youtube"><iframe width="420" height="315" src="//www.youtube.com/embed/BwNrmYRiX_o" frameborder="0" allowfullscreen></iframe></div>', result
  end

  def test_transform2
    result = auto_html('http://www.youtube.com/watch?v=BwNrmYRiX_o&eurl=http%3A%2F%2Fvukajlija.com%2Fvideo%2Fklipovi%3Fstrana%3D6&feature=player_embedded') { youtube }
    assert_equal '<div class="video youtube"><iframe width="420" height="315" src="//www.youtube.com/embed/BwNrmYRiX_o" frameborder="0" allowfullscreen></iframe></div>', result
  end

  def test_transform3
    result = auto_html('http://www.youtube.com/watch?v=BwNrmYRiX_o&feature=related') { youtube }
    assert_equal '<div class="video youtube"><iframe width="420" height="315" src="//www.youtube.com/embed/BwNrmYRiX_o" frameborder="0" allowfullscreen></iframe></div>', result
  end

  def test_transform4
    result = auto_html('foo http://www.youtube.com/watch?v=fT1ahr81HLw bar') { youtube }
    assert_equal 'foo <div class="video youtube"><iframe width="420" height="315" src="//www.youtube.com/embed/fT1ahr81HLw" frameborder="0" allowfullscreen></iframe></div> bar', result
  end

  def test_transform5
    result = auto_html('foo http://www.youtube.com/watch?v=fT1ahr81HLw<br>bar') { youtube }
    assert_equal 'foo <div class="video youtube"><iframe width="420" height="315" src="//www.youtube.com/embed/fT1ahr81HLw" frameborder="0" allowfullscreen></iframe></div><br>bar', result
  end

  def test_transform_url_without_www
    result = auto_html('http://youtube.com/watch?v=BwNrmYRiX_o') { youtube }
    assert_equal '<div class="video youtube"><iframe width="420" height="315" src="//www.youtube.com/embed/BwNrmYRiX_o" frameborder="0" allowfullscreen></iframe></div>', result
  end

  def test_transform_with_options
    result = auto_html('http://www.youtube.com/watch?v=BwNrmYRiX_o') { youtube(:width => 300, :height => 255, :frameborder => 1, :wmode => 'window') }
    assert_equal '<div class="video youtube"><iframe width="300" height="255" src="//www.youtube.com/embed/BwNrmYRiX_o?wmode=window" frameborder="1" allowfullscreen></iframe></div>', result
  end

  def test_transform_with_short_url
    result = auto_html('http://www.youtu.be/BwNrmYRiX_o') { youtube }
    assert_equal '<div class="video youtube"><iframe width="420" height="315" src="//www.youtube.com/embed/BwNrmYRiX_o" frameborder="0" allowfullscreen></iframe></div>', result
  end

  def test_transform_with_user_params_and_no_start_timecode
    result = auto_html("https://www.youtube.com/watch?v=t7NdBIA4zJg") { youtube(user_params: true) }
    assert_equal '<div class="video youtube"><iframe width="420" height="315" src="//www.youtube.com/embed/t7NdBIA4zJg" frameborder="0" allowfullscreen></iframe></div>', result
  end

  def test_transform_with_start_timecode
    result = auto_html("https://www.youtube.com/watch?v=t7NdBIA4zJg?t=1m30s") { youtube(user_params: true) }
    assert_equal '<div class="video youtube"><iframe width="420" height="315" src="//www.youtube.com/embed/t7NdBIA4zJg?start=90" frameborder="0" allowfullscreen></iframe></div>', result
  end

  def test_transform_https
    result = auto_html("https://www.youtube.com/watch?v=t7NdBIA4zJg") { youtube }
    assert_equal '<div class="video youtube"><iframe width="420" height="315" src="//www.youtube.com/embed/t7NdBIA4zJg" frameborder="0" allowfullscreen></iframe></div>', result
  end

  def test_short_with_params
    result = auto_html("http://youtu.be/t7NdBIA4zJg?t=1s&hd=1") { youtube }
    assert_equal '<div class="video youtube"><iframe width="420" height="315" src="//www.youtube.com/embed/t7NdBIA4zJg" frameborder="0" allowfullscreen></iframe></div>', result
  end

  def test_short_with_start_time
    result = auto_html("http://youtu.be/t7NdBIA4zJg?start=200sdfsdg&end=300s&hd=1") { youtube(user_params: true) }
    assert_equal '<div class="video youtube"><iframe width="420" height="315" src="//www.youtube.com/embed/t7NdBIA4zJg?start=200&end=300" frameborder="0" allowfullscreen></iframe></div>', result
  end

  def test_short_with_start_timecode
    result = auto_html("http://youtu.be/t7NdBIA4zJg?t=1h10m30s&hd=1") { youtube(user_params: true) }
    assert_equal '<div class="video youtube"><iframe width="420" height="315" src="//www.youtube.com/embed/t7NdBIA4zJg?start=4230" frameborder="0" allowfullscreen></iframe></div>', result
  end

  def test_transform_without_protocol
    result = auto_html("www.youtube.com/watch?v=t7NdBIA4zJg") { youtube }
    assert_equal '<div class="video youtube"><iframe width="420" height="315" src="//www.youtube.com/embed/t7NdBIA4zJg" frameborder="0" allowfullscreen></iframe></div>', result
  end

  def test_multiple_questionable_urls_in_one_string
    result = auto_html("http://www.youtube.com/watch?v=bjN8_S4xVc4&amp;feature=share&amp;list=TL5YfrkNQnNVE http://www.youtube.com/watch?v=79maSdfxQCU&amp;list=TL3GbaFhZ6ji4") { youtube(user_params: true) }
    assert_equal '<div class="video youtube"><iframe width="420" height="315" src="//www.youtube.com/embed/bjN8_S4xVc4" frameborder="0" allowfullscreen></iframe></div> <div class="video youtube"><iframe width="420" height="315" src="//www.youtube.com/embed/79maSdfxQCU" frameborder="0" allowfullscreen></iframe></div>', result
  end

  def test_short_with_start_timecode_in_minutes_only
    result = auto_html("http://youtu.be/qglAm8QiX5k?t=10m") { youtube(user_params: true) }
    assert_equal '<div class="video youtube"><iframe width="420" height="315" src="//www.youtube.com/embed/qglAm8QiX5k?start=600" frameborder="0" allowfullscreen></iframe></div>', result
  end

  def test_short_with_start_timecode_in_seconds_only
    result = auto_html("http://youtu.be/qglAm8QiX5k?t=33s") { youtube(user_params: true) }
    assert_equal '<div class="video youtube"><iframe width="420" height="315" src="//www.youtube.com/embed/qglAm8QiX5k?start=33" frameborder="0" allowfullscreen></iframe></div>', result
  end
end
