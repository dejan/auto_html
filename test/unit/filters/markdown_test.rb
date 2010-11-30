require File.dirname(__FILE__) + '/../unit_test_helper'

class MarkdownTest < Test::Unit::TestCase

  def test_transform
    result = auto_html('Hey check out my blog => http://rors.org') { markdown }
    assert_equal '<p>Hey check out my blog => http://rors.org</p>', result
  end

  def test_trasform2
    result = auto_html('Hey check out my code => http://github.com/dejan') { markdown }
    assert_equal '<p>Hey check out my code => http://github.com/dejan</p>', result
  end

end
