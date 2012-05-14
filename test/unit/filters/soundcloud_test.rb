require File.expand_path('../../unit_test_helper', __FILE__)

class SoundcloudTest < Test::Unit::TestCase

  def test_transform_url_with_www
    result = auto_html('http://www.soundcloud.com/forss/flickermood') { soundcloud }
    assert_equal '<iframe width="100%" height="166" scrolling="no" frameborder="no" src="http://w.soundcloud.com/player/?url=http%3A%2F%2Fapi.soundcloud.com%2Ftracks%2F293&show_artwork=true"></iframe>', result
  end

  def test_transform_url_without_www
    result = auto_html('http://soundcloud.com/forss/flickermood') { soundcloud }
    assert_equal '<iframe width="100%" height="166" scrolling="no" frameborder="no" src="http://w.soundcloud.com/player/?url=http%3A%2F%2Fapi.soundcloud.com%2Ftracks%2F293&show_artwork=true"></iframe>', result
  end

  def test_transform_url_without_protocol
    result = auto_html('soundcloud.com/forss/flickermood') { soundcloud }
    assert_equal '<iframe width="100%" height="166" scrolling="no" frameborder="no" src="http://w.soundcloud.com/player/?url=http%3A%2F%2Fapi.soundcloud.com%2Ftracks%2F293&show_artwork=true"></iframe>', result
  end

  def test_transform_url_with_ssl
    result = auto_html('https://soundcloud.com/forss/flickermood') { soundcloud }
    assert_equal '<iframe width="100%" height="166" scrolling="no" frameborder="no" src="http://w.soundcloud.com/player/?url=http%3A%2F%2Fapi.soundcloud.com%2Ftracks%2F293&show_artwork=true"></iframe>', result
  end

  def test_transform_url_with_options
    result = auto_html('http://www.soundcloud.com/forss/flickermood') { soundcloud(:maxwidth => '100', :maxheight => '100', :auto_play => false, :show_comments => false) }
    assert_equal '<iframe width="100" height="100" scrolling="no" frameborder="no" src="http://w.soundcloud.com/player/?url=http%3A%2F%2Fapi.soundcloud.com%2Ftracks%2F293&show_artwork=true&maxwidth=100&maxheight=100&auto_play=false&show_comments=false"></iframe>', result
  end
end
