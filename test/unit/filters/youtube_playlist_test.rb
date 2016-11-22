require File.expand_path('../../unit_test_helper', __FILE__)

class YouTubePlaylistTest < Minitest::Test

  def test_transform
    result = auto_html('http://www.youtube.com/playlist?p=PL9hW1uS6HUftLdHI6RIsaf-iXTm09qnEr') { youtube_playlist }
    assert_equal '<div class="video youtube"><iframe width="420" height="315" src="//www.youtube.com/embed/videoseries?list=PL9hW1uS6HUftLdHI6RIsaf-iXTm09qnEr" frameborder="0" allowfullscreen></iframe></div>', result
  end

  def test_transform_2
    result = auto_html('http://www.youtube.com/playlist?list=PL9hW1uS6HUftLdHI6RIsaf-iXTm09qnEr') { youtube_playlist }
    assert_equal '<div class="video youtube"><iframe width="420" height="315" src="//www.youtube.com/embed/videoseries?list=PL9hW1uS6HUftLdHI6RIsaf-iXTm09qnEr" frameborder="0" allowfullscreen></iframe></div>', result
  end

  def test_transform_with_options
    result = auto_html('http://www.youtube.com/playlist?list=PL9hW1uS6HUftLdHI6RIsaf-iXTm09qnEr') { youtube_playlist(width: 300, height: 255, autoplay: true, frameborder: 1) }
    assert_equal '<div class="video youtube"><iframe width="300" height="255" src="//www.youtube.com/embed/videoseries?list=PL9hW1uS6HUftLdHI6RIsaf-iXTm09qnEr&autoplay=1" frameborder="1" allowfullscreen></iframe></div>', result
  end
end
