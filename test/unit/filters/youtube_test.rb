require File.expand_path('../../unit_test_helper', __FILE__)

class YouTubeTest < Test::Unit::TestCase

  def test_transform
    result = auto_html('http://www.youtube.com/watch?v=BwNrmYRiX_o') { youtube }
    assert_equal '<iframe class="youtube-player" type="text/html" width="390" height="250" src="http://www.youtube.com/embed/BwNrmYRiX_o" frameborder="0">
</iframe>', result
  end

  def test_transform2
    result = auto_html('http://www.youtube.com/watch?v=BwNrmYRiX_o&eurl=http%3A%2F%2Fvukajlija.com%2Fvideo%2Fklipovi%3Fstrana%3D6&feature=player_embedded') { youtube }
    assert_equal '<iframe class="youtube-player" type="text/html" width="390" height="250" src="http://www.youtube.com/embed/BwNrmYRiX_o" frameborder="0">
</iframe>', result
  end

  def test_transform3
    result = auto_html('http://www.youtube.com/watch?v=BwNrmYRiX_o&feature=related') { youtube }
    assert_equal '<iframe class="youtube-player" type="text/html" width="390" height="250" src="http://www.youtube.com/embed/BwNrmYRiX_o" frameborder="0">
</iframe>', result
  end

  def test_transform_url_without_www
    result = auto_html('http://youtube.com/watch?v=BwNrmYRiX_o') { youtube }
    assert_equal '<iframe class="youtube-player" type="text/html" width="390" height="250" src="http://www.youtube.com/embed/BwNrmYRiX_o" frameborder="0">
</iframe>', result
  end

  def test_transform_with_options
    result = auto_html('http://www.youtube.com/watch?v=BwNrmYRiX_o') { youtube(:width => 300, :height => 255, :frameborder => 1) }
    assert_equal '<iframe class="youtube-player" type="text/html" width="300" height="255" src="http://www.youtube.com/embed/BwNrmYRiX_o" frameborder="1">
</iframe>', result
  end

end
