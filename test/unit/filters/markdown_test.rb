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
  
  def test_transform_list
    result = auto_html("# A heading\n\n* A list\n* A list 2"){ markdown }
    assert_equal "<h1>A heading</h1>\n\n<ul>\n<li>A list</li>\n<li>A list 2</li>\n</ul>\n", result
  end

end
