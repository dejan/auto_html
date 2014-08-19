require File.expand_path('../../unit_test_helper', __FILE__)

class CoubTest < Test::Unit::TestCase
  def test_transform
    result = auto_html('http://coub.com/view/24qpb') { coub }
    assert_equal '<iframe src="//coub.com/embed/24qpb?muted=false&autostart=false&originalSize=false&hideTopBar=false&noSiteButtons=false&startWithHD=false" width="640" height="480" frameborder="0" "allowfullscreen"></iframe>', result
  end

  def test_transform_url_with_www
    result = auto_html('http://www.coub.com/view/24qpb') { coub }
    assert_equal '<iframe src="//coub.com/embed/24qpb?muted=false&autostart=false&originalSize=false&hideTopBar=false&noSiteButtons=false&startWithHD=false" width="640" height="480" frameborder="0" "allowfullscreen"></iframe>', result
  end

  def test_transform_with_options
    result = auto_html('http://coub.com/view/24qpb') { coub(width: 300, height: 255, frameborder: 1) }
    assert_equal '<iframe src="//coub.com/embed/24qpb?muted=false&autostart=false&originalSize=false&hideTopBar=false&noSiteButtons=false&startWithHD=false" width="300" height="255" frameborder="1" "allowfullscreen"></iframe>', result
  end

  def test_transform_https
    result = auto_html('https://coub.com/view/24qpb') { coub }
    assert_equal '<iframe src="//coub.com/embed/24qpb?muted=false&autostart=false&originalSize=false&hideTopBar=false&noSiteButtons=false&startWithHD=false" width="640" height="480" frameborder="0" "allowfullscreen"></iframe>', result
  end

  def test_transform_embed_url
    result = auto_html('http://coub.com/embed/24qpb') { coub }
    assert_equal '<iframe src="//coub.com/embed/24qpb?muted=false&autostart=false&originalSize=false&hideTopBar=false&noSiteButtons=false&startWithHD=false" width="640" height="480" frameborder="0" "allowfullscreen"></iframe>', result
  end
end
