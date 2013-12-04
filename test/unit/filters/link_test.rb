require File.expand_path('../../unit_test_helper', __FILE__)

class LinkTest < Test::Unit::TestCase

  def test_transform
    result = auto_html("http://vukajlija.com") { link }
    assert_equal '<a href="http://vukajlija.com" >http://vukajlija.com</a>', result
  end

  def test_transform_with_the_slash_at_the_end
    result = auto_html("http://github.com/") { link }
    assert_equal '<a href="http://github.com/" >http://github.com/</a>', result
  end

  def test_transform_with_param
    result = auto_html('http://example.com/abc?query=ruby') { link }
    assert_equal '<a href="http://example.com/abc?query=ruby" >http://example.com/abc?query=ruby</a>', result
  end

  def test_transform_with_param_and_trailing_dot
    result = auto_html('http://example.com/abc?query=ruby.') { link }
    assert_equal '<a href="http://example.com/abc?query=ruby" >http://example.com/abc?query=ruby</a>.', result
  end

  def test_transform_with_anchor_and_trailing_dot
    result = auto_html('http://example.com/example#id=123.12.') { link }
    assert_equal '<a href="http://example.com/example#id=123.12" >http://example.com/example#id=123.12</a>.', result
  end

  def test_transform_with_commas
    result = auto_html('http://www.dw-world.de/dw/article/0,,4708386,00.html?maca=ser-rss-ser-all-1494-rdf') { link }
    assert_equal '<a href="http://www.dw-world.de/dw/article/0,,4708386,00.html?maca=ser-rss-ser-all-1494-rdf" >http://www.dw-world.de/dw/article/0,,4708386,00.html?maca=ser-rss-ser-all-1494-rdf</a>', result
  end

  def test_transform_complex_url
    url = 'http://www.google.com/#q=nikola+tesla&ct=tesla09&oi=ddle&fp=Xmf0jJ9P_V0'
    # uses auto_link instead raw to support both Rails 2 & 3
    assert_equal('<a href="http://www.google.com/#q=nikola+tesla&ct=tesla09&oi=ddle&fp=Xmf0jJ9P_V0" >http://www.google.com/#q=nikola+tesla&ct=tesla09&oi=ddle&fp=Xmf0jJ9P_V0</a>', auto_html(url) { link })
  end

  def test_transform_with_options
    result = auto_html("http://rors.org") { link :target => "_blank" }
    assert_equal '<a href="http://rors.org" target="_blank">http://rors.org</a>', result
  end

  def test_transform_with_short_link_name_option
    result = auto_html("http://rors.org?some=params&and=more") { link :short_link_name => true }
    assert_equal '<a href="http://rors.org?some=params&and=more" >http://rors.org</a>', result
  end

  def test_transform_with_short_link_name_option_false
    result = auto_html("http://rors.org?some=params&and=more") { link :short_link_name => false }
    assert_equal '<a href="http://rors.org?some=params&and=more" >http://rors.org?some=params&and=more</a>', result
  end
end
