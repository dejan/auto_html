require File.expand_path('../../unit_test_helper', __FILE__)
require 'fakeweb'

class SoundcloudTest < Test::Unit::TestCase
  
  def setup
    response = '{"version":1.0,"type":"rich","provider_name":"SoundCloud","provider_url":"http://soundcloud.com","height":166,"width":"100%","title":"Flickermood by Forss","description":"From the Soulhack album,\u0026nbsp;recently featured in this ad \u003Ca href=\"https://www.dswshoes.com/tv_commercial.jsp?m=october2007\"\u003Ehttps://www.dswshoes.com/tv_commercial.jsp?m=october2007\u003C/a\u003E ","thumbnail_url":"http://i1.sndcdn.com/artworks-000000001720-91c40a-t500x500.jpg?330b92d","html":"\u003Ciframe width=\"100%\" height=\"166\" scrolling=\"no\" frameborder=\"no\" src=\"http://w.soundcloud.com/player/?url=http%3A%2F%2Fapi.soundcloud.com%2Ftracks%2F293\u0026show_artwork=true\"\u003E\u003C/iframe\u003E","author_name":"Forss","author_url":"http://soundcloud.com/forss"}'
    FakeWeb.register_uri(:get, %r|http://soundcloud\.com/oembed|, :body => response)
  end
  
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
    response = '{"version":1.0,"type":"rich","provider_name":"SoundCloud","provider_url":"http://soundcloud.com","height":100,"width":100,"title":"Flickermood by Forss","description":"From the Soulhack album,\u0026nbsp;recently featured in this ad \u003Ca href=\"https://www.dswshoes.com/tv_commercial.jsp?m=october2007\"\u003Ehttps://www.dswshoes.com/tv_commercial.jsp?m=october2007\u003C/a\u003E ","thumbnail_url":"http://i1.sndcdn.com/artworks-000000001720-91c40a-t500x500.jpg?330b92d","html":"\u003Ciframe width=\"100\" height=\"100\" scrolling=\"no\" frameborder=\"no\" src=\"http://w.soundcloud.com/player/?url=http%3A%2F%2Fapi.soundcloud.com%2Ftracks%2F293\u0026show_artwork=true\u0026show_comments=false\u0026maxwidth=100\u0026maxheight=100\u0026auto_play=false\"\u003E\u003C/iframe\u003E","author_name":"Forss","author_url":"http://soundcloud.com/forss"}'
    FakeWeb.register_uri(:get, %r|http://soundcloud\.com/oembed|, :body => response)

    result = auto_html('http://www.soundcloud.com/forss/flickermood') { soundcloud(:maxwidth => '100', :maxheight => '100', :auto_play => false, :show_comments => false) }
    assert_equal '<iframe width="100" height="100" scrolling="no" frameborder="no" src="http://w.soundcloud.com/player/?url=http%3A%2F%2Fapi.soundcloud.com%2Ftracks%2F293&show_artwork=true&show_comments=false&maxwidth=100&maxheight=100&auto_play=false"></iframe>', result
  end
end
