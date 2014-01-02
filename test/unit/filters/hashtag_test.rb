require File.expand_path('../../unit_test_helper', __FILE__)

class HashtagTest < Test::Unit::TestCase

  def test_transform
    result = auto_html("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec vel ipsum et leo adipiscing ultrices. Etiam ac elementum cras amet. #LoremIpsum") { hashtag }
    assert_equal 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec vel ipsum et leo adipiscing ultrices. Etiam ac elementum cras amet. <a href="http://twitter.com/search?q=%23LoremIpsum&f=realtime" class="hashtag" target="_blank">#LoremIpsum</a>', result
  end

  def test_transform_with_multiple_hashtags
    result = auto_html("Lorem ipsum #dolor sit amet, consectetur adipiscing elit. Donec vel ipsum et leo #adipiscingUltrices. Etiam ac elementum cras amet.") { hashtag }
    assert_equal 'Lorem ipsum <a href="http://twitter.com/search?q=%23dolor&f=realtime" class="hashtag" target="_blank">#dolor</a> sit amet, consectetur adipiscing elit. Donec vel ipsum et leo <a href="http://twitter.com/search?q=%23adipiscingUltrices.&f=realtime" class="hashtag" target="_blank">#adipiscingUltrices.</a> Etiam ac elementum cras amet.', result
  end

  def test_transform_with_twitter_source
    result = auto_html("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec vel ipsum et leo adipiscing ultrices. Etiam ac elementum cras amet. #LoremIpsum") { hashtag source: :twitter }
    assert_equal 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec vel ipsum et leo adipiscing ultrices. Etiam ac elementum cras amet. <a href="http://twitter.com/search?q=%23LoremIpsum&f=realtime" class="hashtag" target="_blank">#LoremIpsum</a>', result
  end

  def test_transform_with_facebook_source
    result = auto_html("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec vel ipsum et leo adipiscing ultrices. Etiam ac elementum cras amet. #LoremIpsum") { hashtag source: :facebook }
    assert_equal 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec vel ipsum et leo adipiscing ultrices. Etiam ac elementum cras amet. <a href="https://www.facebook.com/hashtag/LoremIpsum" class="hashtag" target="_blank">#LoremIpsum</a>', result
  end

end
