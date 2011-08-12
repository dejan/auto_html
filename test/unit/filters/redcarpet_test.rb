require File.expand_path('../../unit_test_helper', __FILE__)

class RedcarpetTest < Test::Unit::TestCase

  def test_transform_strong
    result = auto_html("This is **my** text.") { redcarpet }
    assert_equal '<p>This is <strong>my</strong> text.</p>'+"\n", result
  end

  def test_transform_title
    result = auto_html("## This is a title ##") { redcarpet }
    assert_equal '<h2>This is a title</h2>'+"\n", result
  end

  def test_transform_link
    result = auto_html('[This is a link](http://example.org/)') { redcarpet }
    assert_equal '<p><a href="http://example.org/">This is a link</a></p>'+"\n", result
  end

  def test_transform_link_target_blank
    result = auto_html('[This is a link](http://example.org/)') { redcarpet :target => :_blank }
    assert_equal '<p><a target="_blank" href="http://example.org/">This is a link</a></p>'+"\n", result
  end

end