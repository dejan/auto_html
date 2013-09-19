require File.expand_path('../unit_test_helper', __FILE__)


class AutoHtmlTest < Test::Unit::TestCase

  def test_should_be_raw_input_when_no_filters_provided
    input = "Hey check out my blog => http://rors.org"
    result = auto_html(input) { }
    assert_equal result, input
  end

  def test_should_apply_simple_format_filter
    result = auto_html("Hey check out my blog => http://rors.org") { simple_format }
    assert_equal "<p>Hey check out my blog => http://rors.org</p>", result
  end

  def test_should_apply_simple_format_and_image_filter
    result = auto_html("Check the logo: http://rors.org/images/rails.png") { simple_format; image(:alt => nil) }
    assert_equal '<p>Check the logo: <img src="http://rors.org/images/rails.png" alt=""/></p>', result
  end

  def test_should_apply_simple_format_image_and_link_filter
    result = auto_html("Check the logo: http://rors.org/images/rails.png. Visit: http://rubyonrails.org") { simple_format; image(:alt => nil); link }
    assert_equal '<p>Check the logo: <img src="http://rors.org/images/rails.png" alt=""/>. Visit: <a href="http://rubyonrails.org" >http://rubyonrails.org</a></p>', result
  end
  
  def test_should_return_blank_if_input_is_blank
    result = auto_html("") { simple_format; image(:alt => nil); link }
    assert_equal "", result
  end
  
  def test_should_not_apply_simple_format_if_input_is_nil
    result = auto_html(nil) { simple_format; image(:alt => nil); link }
    assert_equal "", result
  end

end