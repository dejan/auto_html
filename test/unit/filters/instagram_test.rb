require File.expand_path('../../unit_test_helper', __FILE__)

class InstagramTest < Minitest::Test
  def test_instagram_embed
    result = auto_html('http://instagram.com/p/WsQTLAGvx7/') { instagram }
    assert_equal '<iframe src="http://instagram.com/p/WsQTLAGvx7/embed" height="714" width="616" frameborder="0" scrolling="no"></iframe>', result
  end

  def test_instagram_embed_no_slash
    result = auto_html('http://instagram.com/p/WsQTLAGvx7') { instagram }
    assert_equal '<iframe src="http://instagram.com/p/WsQTLAGvx7/embed" height="714" width="616" frameborder="0" scrolling="no"></iframe>', result
  end

  # Filter was appending '/' to the end of all text, 
  # not just the URL this filter was affecting.
  #
  # Dumb.
  def test_normal_text_not_transformed
    expected = "Some random text\nHello Friends"
    result = auto_html(expected) { instagram }
    assert_equal(expected, result)
  end

  def test_prevent_html_transform
    str = '<iframe src="http://instagram.com/p/WsQTLAGvx7/embed" height="714" width="616" frameborder="0" scrolling="no"></iframe>'

    result = auto_html(str) { vimeo }

    assert_equal(
      str, result, 
      "Should not re-transform HTML with Instagram embeds"
    )
  end

end