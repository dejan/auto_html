require File.dirname(__FILE__) + '/../unit_test_helper'

class GoogleVideoTest < Test::Unit::TestCase

  def test_transform
    result = auto_html("http://video.google.com/videoplay?docid=-7533500868750350977&ei=Xin8Sc-KBYeg2ALXkKymAQ&q=office+space&emb=1") { google_video }
    assert_equal '<object width="650" height="391"><param name="movie" value="http://video.google.com/googleplayer.swf?docid=-7533500868750350977&hl=en&fs=true"></param><param name="wmode" value="transparent"></param><embed src="http://video.google.com/googleplayer.swf?docid=-7533500868750350977" type="application/x-shockwave-flash" wmode="transparent" width="650" height="391"></embed></object>', result
  end

  def test_transform_with_options
    result = auto_html("http://video.google.com/videoplay?docid=7442132741322615356") { google_video(:width => 500, :height => 300) }
    assert_equal '<object width="500" height="300"><param name="movie" value="http://video.google.com/googleplayer.swf?docid=7442132741322615356&hl=en&fs=true"></param><param name="wmode" value="transparent"></param><embed src="http://video.google.com/googleplayer.swf?docid=7442132741322615356" type="application/x-shockwave-flash" wmode="transparent" width="500" height="300"></embed></object>', result
  end

end