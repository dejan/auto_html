require File.expand_path('../../unit_test_helper', __FILE__)

class InstagramTest < Test::Unit::TestCase
  def test_instagram_embed
    result = auto_html('http://instagram.com/p/WsQTLAGvx7/') { instagram }
    assert_equal '<iframe src="http://instagram.com/p/WsQTLAGvx7/embed" height="714" width="616" frameborder="0" scrolling="no"></iframe>', result
  end

  def test_instagram_embed2
    result = auto_html('bla bla http://instagram.com/p/WsQTLAGvx7/ bla bla') { instagram }
    assert_equal 'bla bla <iframe src="http://instagram.com/p/WsQTLAGvx7/embed" height="714" width="616" frameborder="0" scrolling="no"></iframe> bla bla', result
  end

  def test_instagram_embed3
    result = auto_html('bla bla http://instagram.com/p/WsQTLAGvx7/?modal=true bla bla') { instagram }
    assert_equal 'bla bla <iframe src="http://instagram.com/p/WsQTLAGvx7/embed" height="714" width="616" frameborder="0" scrolling="no"></iframe> bla bla', result
  end

  def test_instagram_embed4
    result = auto_html('bla bla http://instagram.com/p/WsQTLAGvx7/?modal=true bla bla') { instagram }
    assert_equal 'bla bla <iframe src="http://instagram.com/p/WsQTLAGvx7/embed" height="714" width="616" frameborder="0" scrolling="no"></iframe> bla bla', result
  end

  def test_instagram_embed5
    result = auto_html('bla bla http://instagram.com/p/WsQTLAGvx7 bla bla') { instagram }
    assert_equal 'bla bla <iframe src="http://instagram.com/p/WsQTLAGvx7/embed" height="714" width="616" frameborder="0" scrolling="no"></iframe> bla bla', result
  end

  def test_instagram_embed6
    result = auto_html('bla bla http://instagr.am/p/WsQTLAGvx7/?modal=true bla bla') { instagram }
    assert_equal 'bla bla <iframe src="http://instagr.am/p/WsQTLAGvx7/embed" height="714" width="616" frameborder="0" scrolling="no"></iframe> bla bla', result
  end

  def test_instagram_embed7
    result = auto_html('bla bla https://instagr.am/p/WsQTLAGvx7/?modal=true bla bla') { instagram }
    assert_equal 'bla bla <iframe src="https://instagr.am/p/WsQTLAGvx7/embed" height="714" width="616" frameborder="0" scrolling="no"></iframe> bla bla', result
  end

  def test_instagram_embed8
    result = auto_html('bla bla instagr.am/p/WsQTLAGvx7/?modal=true bla bla') { instagram }
    assert_equal 'bla bla <iframe src="http://instagr.am/p/WsQTLAGvx7/embed" height="714" width="616" frameborder="0" scrolling="no"></iframe> bla bla', result
  end

  def test_instagram_embed8
    result = auto_html('bla bla instagr.am/p/WsQTLAGvx7/?modal=true bla bla http://instagram.com/p/WsQTLAGvx7/ bla bla') { instagram }
    assert_equal 'bla bla <iframe src="http://instagr.am/p/WsQTLAGvx7/embed" height="714" width="616" frameborder="0" scrolling="no"></iframe> bla bla <iframe src="http://instagram.com/p/WsQTLAGvx7/embed" height="714" width="616" frameborder="0" scrolling="no"></iframe> bla bla', result
  end

  def test_instagram_size
    result = auto_html('http://instagram.com/p/WsQTLAGvx7/') { instagram :width => 420 }
    assert_equal '<iframe src="http://instagram.com/p/WsQTLAGvx7/embed" height="714" width="420" frameborder="0" scrolling="no"></iframe>', result
  end

  def test_instagram_size2
    result = auto_html('http://instagram.com/p/WsQTLAGvx7/') { instagram :height => 420 }
    assert_equal '<iframe src="http://instagram.com/p/WsQTLAGvx7/embed" height="420" width="616" frameborder="0" scrolling="no"></iframe>', result
  end

  def test_instagram_size3
    result = auto_html('http://instagram.com/p/WsQTLAGvx7/') { instagram :frameborder => 4 }
    assert_equal '<iframe src="http://instagram.com/p/WsQTLAGvx7/embed" height="714" width="616" frameborder="4" scrolling="no"></iframe>', result
  end

  def test_instagram_size4
    result = auto_html('http://instagram.com/p/WsQTLAGvx7/') { instagram :width => 420, :height => 420, :frameborder => 4 }
    assert_equal '<iframe src="http://instagram.com/p/WsQTLAGvx7/embed" height="420" width="420" frameborder="4" scrolling="no"></iframe>', result
  end
end