require File.expand_path('../../unit_test_helper', __FILE__)
require 'fakeweb'

class SoundcloudTest < Test::Unit::TestCase
  def test_transform_url_with_www
    result = auto_html('http://www.soundcloud.com/forss/flickermood') { soundcloud }
    assert_equal '<iframe width="100%" height="166" scrolling="no" frameborder="no" src="http://w.soundcloud.com/player/?url=http://www.soundcloud.com/forss/flickermood&show_artwork=false&show_comments=false&auto_play=false&color=915f33&theme_color=00FF00"></iframe>', result
  end

  def test_transform_url_without_www
    result = auto_html('http://soundcloud.com/forss/flickermood') { soundcloud }
    assert_equal '<iframe width="100%" height="166" scrolling="no" frameborder="no" src="http://w.soundcloud.com/player/?url=http://soundcloud.com/forss/flickermood&show_artwork=false&show_comments=false&auto_play=false&color=915f33&theme_color=00FF00"></iframe>', result
  end

  def test_transform_url_without_protocol
    result = auto_html('soundcloud.com/forss/flickermood') { soundcloud }
    assert_equal '<iframe width="100%" height="166" scrolling="no" frameborder="no" src="http://w.soundcloud.com/player/?url=http://soundcloud.com/forss/flickermood&show_artwork=false&show_comments=false&auto_play=false&color=915f33&theme_color=00FF00"></iframe>', result
  end

  def test_transform_url_with_ssl
    result = auto_html('https://soundcloud.com/forss/flickermood') { soundcloud }
    assert_equal '<iframe width="100%" height="166" scrolling="no" frameborder="no" src="http://w.soundcloud.com/player/?url=https://soundcloud.com/forss/flickermood&show_artwork=false&show_comments=false&auto_play=false&color=915f33&theme_color=00FF00"></iframe>', result
  end

  def test_transform_url_with_options
    result = auto_html('http://www.soundcloud.com/forss/flickermood') { soundcloud(:width => '50%', :height => '100', :auto_play => true, :show_comments => true) }    
    assert_equal '<iframe width="50%" height="100" scrolling="no" frameborder="no" src="http://w.soundcloud.com/player/?url=http://www.soundcloud.com/forss/flickermood&show_artwork=false&show_comments=true&auto_play=true&color=915f33&theme_color=00FF00"></iframe>', result
  end
end
