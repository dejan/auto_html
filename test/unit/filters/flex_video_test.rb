require File.expand_path('../../unit_test_helper', __FILE__)

class FlexVideoTest < Test::Unit::TestCase

  def test_transform
    result = auto_html('This is a video') { flex_video }
    assert_equal '<div class="flex-video">This is a video</div>', result
  end

  def test_transform_with_liveleak
    result = auto_html('http://www.liveleak.com/view?i=BwNrmYRiX_o') { liveleak; flex_video }
    assert_equal '<div class="flex-video"><iframe width="420" height="315" src="http://www.liveleak.com/ll_embed?f=BwNrmYRiX_o" frameborder="0" allowfullscreen></iframe></div>', result
  end

end
