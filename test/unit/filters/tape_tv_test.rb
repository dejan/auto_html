require File.expand_path('../../unit_test_helper', __FILE__)
require 'fakeweb'

class TapeTvTest < Test::Unit::TestCase
  def test_transform
    result = auto_html('http://www.tape.tv/artist/videos/track') { tape_tv(width: 515, height: 300, frameborder: 1) }
    assert_equal '<iframe width="515" height="300" src="http://www.tape.tv/artist/videos/track" frameborder="1" allowfullscreen></iframe>', result
  end
end
