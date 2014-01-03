require File.expand_path('../../unit_test_helper', __FILE__)

class WorldstarTest < Test::Unit::TestCase 

	def test_transform
		result = auto_html('http://www.worldstarhiphop.com/videos/video.php?v=wshhc29WLkx550Hv9o31') { worldstar }
		assert_equal '<object width="448" height="374"><param name="movie" value="http://www.worldstarhiphop.com/videos/e/16711680/wshhc29WLkx550Hv9o31"><param name="allowFullScreen" value="true"></param><embed src="http://www.worldstarhiphop.com/videos/e/16711680/wshhc29WLkx550Hv9o31" type="application/x-shockwave-flash" allowFullscreen="true" width="448" height="374"></embed></object>', result
	end

	def test_transform_with_options
		result = auto_html('http://www.worldstarhiphop.com/videos/video.php?v=wshhc29WLkx550Hv9o31') { worldstar(:width => 400, :height => 250)}
		assert_equal '<object width="400" height="250"><param name="movie" value="http://www.worldstarhiphop.com/videos/e/16711680/wshhc29WLkx550Hv9o31"><param name="allowFullScreen" value="true"></param><embed src="http://www.worldstarhiphop.com/videos/e/16711680/wshhc29WLkx550Hv9o31" type="application/x-shockwave-flash" allowFullscreen="true" width="400" height="250"></embed></object>', result
	end
end