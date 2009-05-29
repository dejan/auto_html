require File.dirname(__FILE__) + '/unit_test_helper'

class AutoHtmlTest < Test::Unit::TestCase

  def test_should_be_nil_no_filters_provided
    result = auto_html("Hey check out my blog => http://rors.org") { }
    assert_nil result
  end

  def test_should_apply_simple_format_filter
    result = auto_html("Hey check out my blog => http://rors.org") { simple_format }
    assert_equal "<p>Hey check out my blog => http://rors.org</p>", result
  end

  def test_should_apply_simple_format_and_image_filter
    result = auto_html("Check the logo: http://rors.org/images/rails.png") { simple_format; image }
    assert_equal '<p>Check the logo: <img src="http://rors.org/images/rails.png" alt=""/></p>', result
  end

  def test_should_apply_simple_format_image_and_link_filter
    result = auto_html("Check the logo: http://rors.org/images/rails.png. Visit: http://rubyonrails.org") { simple_format; image; link }
    assert_equal '<p>Check the logo: <img src="http://rors.org/images/rails.png" alt=""/>. Visit: <a href="http://rubyonrails.org">http://rubyonrails.org</a></p>', result
  end

end