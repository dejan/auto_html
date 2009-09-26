require File.dirname(__FILE__) + '/../unit_test_helper'

class GoogleVideoTest < Test::Unit::TestCase

  def test_transform
    result = auto_html("http://www.dailymotion.com/en/featured/video/xag4p2_tempsmorttv-episode-01_shortfilms") { dailymotion }
    assert_equal '<object type="application/x-shockwave-flash" data="http://www.dailymotion.com/swf/xag4p2_tempsmorttv-episode-01_shortfilms&related=0" width="480" height="360"><param name="movie" value="http://www.dailymotion.com/swf/xag4p2_tempsmorttv-episode-01_shortfilms&related=0"></param><param name="allowFullScreen" value="true"></param><param name="allowScriptAccess" value="always"></param><a href="http://www.dailymotion.com/video/xag4p2_tempsmorttv-episode-01_shortfilms?embed=1"><img src="http://www.dailymotion.com/thumbnail/video/xag4p2_tempsmorttv-episode-01_shortfilms" width="480" height="360"/></a></object>', result
  end

  def test_transform_with_tweaked_width
    result = auto_html("http://www.dailymotion.com/related/x9cyf6/video/x9tinl_happy-tree-friends-as-you-wish-part_fun") { dailymotion :width => 500 }
    assert_equal '<object type="application/x-shockwave-flash" data="http://www.dailymotion.com/swf/x9tinl_happy-tree-friends-as-you-wish-part_fun&related=0" width="500" height="360"><param name="movie" value="http://www.dailymotion.com/swf/x9tinl_happy-tree-friends-as-you-wish-part_fun&related=0"></param><param name="allowFullScreen" value="true"></param><param name="allowScriptAccess" value="always"></param><a href="http://www.dailymotion.com/video/x9tinl_happy-tree-friends-as-you-wish-part_fun?embed=1"><img src="http://www.dailymotion.com/thumbnail/video/x9tinl_happy-tree-friends-as-you-wish-part_fun" width="500" height="360"/></a></object>', result
  end

  def test_transform_with_options
    result = auto_html("http://www.dailymotion.com/video/xakv5i") { dailymotion(:width => 500, :height => 300) }
    assert_equal '<object type="application/x-shockwave-flash" data="http://www.dailymotion.com/swf/xakv5i&related=0" width="500" height="300"><param name="movie" value="http://www.dailymotion.com/swf/xakv5i&related=0"></param><param name="allowFullScreen" value="true"></param><param name="allowScriptAccess" value="always"></param><a href="http://www.dailymotion.com/video/xakv5i?embed=1"><img src="http://www.dailymotion.com/thumbnail/video/xakv5i" width="500" height="300"/></a></object>', result
  end

end
