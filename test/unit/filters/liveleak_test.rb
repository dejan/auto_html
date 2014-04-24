require File.expand_path('../../unit_test_helper', __FILE__)

class LiveLeakTest < Test::Unit::TestCase

  DIV_START = '<div class="video-container liveleak">'

  def test_transform
    result = auto_html('http://www.liveleak.com/view?i=BwNrmYRiX_o') { liveleak }
    assert_equal %Q|#{DIV_START}<iframe width="420" height="315" src="http://www.liveleak.com/ll_embed?f=BwNrmYRiX_o" frameborder="0" allowfullscreen></iframe></div>|, result
  end

  def test_transform2
    result = auto_html('http://www.liveleak.com/ll_embed?f=ef8304ab85e5') { liveleak }
    assert_equal %Q|#{DIV_START}<iframe width="420" height="315" src="http://www.liveleak.com/ll_embed?f=ef8304ab85e5" frameborder="0" allowfullscreen></iframe></div>|, result
  end

end
