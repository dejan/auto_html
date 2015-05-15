require File.expand_path('../../unit_test_helper', __FILE__)

class GistTest < Minitest::Test

  def test_transform
    result = auto_html('https://gist.github.com/1710276') { gist }
    assert_equal '<script src="https://gist.github.com/1710276.js"></script>', result
  end

  def test_transform_with_username
    result = auto_html('https://gist.github.com/toctan/c9d3677da5aa021b5c03') { gist }
    assert_equal '<script src="https://gist.github.com/c9d3677da5aa021b5c03.js"></script>', result
  end

end
