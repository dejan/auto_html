require File.expand_path('../../unit_test_helper', __FILE__)

class RutubeTest < Test::Unit::TestCase
  def test_transform
    result = auto_html('http://rutube.ru/video/9c012ab45b2ec97265c5bbdbf538b204') { rutube }
    assert_equal '<iframe src="//rutube.ru/video/embed/9c012ab45b2ec97265c5bbdbf538b204" width="640" height="480" frameborder="0" webkitAllowFullScreen mozallowfullscreen allowfullscreen></iframe>', result
  end

  def test_transform_url_with_www
    result = auto_html('http://rutube.ru/video/9c012ab45b2ec97265c5bbdbf538b204') { rutube }
    assert_equal '<iframe src="//rutube.ru/video/embed/9c012ab45b2ec97265c5bbdbf538b204" width="640" height="480" frameborder="0" webkitAllowFullScreen mozallowfullscreen allowfullscreen></iframe>', result
  end

  def test_transform_with_options
    result = auto_html('http://rutube.ru/video/9c012ab45b2ec97265c5bbdbf538b204') { rutube(width: 300, height: 255, frameborder: 1) }
    assert_equal '<iframe src="//rutube.ru/video/embed/9c012ab45b2ec97265c5bbdbf538b204" width="300" height="255" frameborder="1" webkitAllowFullScreen mozallowfullscreen allowfullscreen></iframe>', result
  end

  def test_transform_https
    result = auto_html('http://rutube.ru/video/9c012ab45b2ec97265c5bbdbf538b204/') { rutube }
    assert_equal '<iframe src="//rutube.ru/video/embed/9c012ab45b2ec97265c5bbdbf538b204" width="640" height="480" frameborder="0" webkitAllowFullScreen mozallowfullscreen allowfullscreen></iframe>', result
  end

  def test_transform_embed_url
    result = auto_html('http://rutube.ru/play/embed/7145689') { rutube }
    assert_equal '<iframe src="//rutube.ru/video/embed/7145689" width="640" height="480" frameborder="0" webkitAllowFullScreen mozallowfullscreen allowfullscreen></iframe>', result
  end
end
