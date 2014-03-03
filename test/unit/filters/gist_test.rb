require File.expand_path('../../unit_test_helper', __FILE__)

class GistTest < Test::Unit::TestCase

  def test_transform
    result = auto_html('https://gist.github.com/1710276') { gist }
    assert_equal '<script type="text/javascript" src="https://gist.github.com/1710276.js"></script>', result
  end

  def test_transform_with_username
    result = auto_html('https://gist.github.com/toctan/6547840') { gist }
    assert_equal '<script type="text/javascript" src="https://gist.github.com/6547840.js"></script>', result
  end

end
