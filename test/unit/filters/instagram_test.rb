require File.expand_path('../../unit_test_helper', __FILE__)

class InstagramTest < Test::Unit::TestCase
  def test_instagram_embed
    result = auto_html('http://instagr.am/p/WsQTLAGvx7/') { instagram }
    assert_equal '<iframe src="//instagram.com/p/WsQTLAGvx7/embed/" height="616" width="714" frameborder="0" scrolling="no"></iframe>', result
  end
end