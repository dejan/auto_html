require File.expand_path('../../unit_test_helper', __FILE__)

class GistTest < Test::Unit::TestCase

  def test_transform
    result = auto_html('https://gist.github.com/1710276') { gist }
    assert_equal '<script src="https://gist.github.com/1710276.js"></script>', result
  end

end