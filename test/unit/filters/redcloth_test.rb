require File.expand_path('../../unit_test_helper', __FILE__)

class RedClothTest < Test::Unit::TestCase

  def test_transform_strong
    result = auto_html("This is *my* text.") { redcloth }
    assert_equal '<p>This is <strong>my</strong> text.</p>', result
  end

  def test_transform_title
    result = auto_html("h2. This is a title") { redcloth }
    assert_equal '<h2>This is a title</h2>', result
  end

  def test_transform_link
    result = auto_html('"This is a link (This is a title)":http://www.textism.com') { redcloth }
    assert_equal '<p><a href="http://www.textism.com" title="This is a title">This is a link</a></p>', result
  end

  def test_transform_link_target_blank
    result = auto_html('"This is a link (This is a title)":http://www.textism.com') { redcloth :target => :_blank }
    assert_equal '<p><a target="_blank" href="http://www.textism.com" title="This is a title">This is a link</a></p>', result
  end

end