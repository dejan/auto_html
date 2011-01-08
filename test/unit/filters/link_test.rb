require File.expand_path('../../unit_test_helper', __FILE__)

class LinkTest < Test::Unit::TestCase

  def test_transform
    result = auto_html("http://vukajlija.com") { link }
    assert_equal '<a href="http://vukajlija.com">http://vukajlija.com</a>', result
  end

  def test_transform_with_the_slash_at_the_end
    result = auto_html("http://github.com/") { link }
    assert_equal '<a href="http://github.com/">http://github.com/</a>', result
  end

  def test_transform_with_param
    result = auto_html('http://example.com/abc?query=ruby') { link }
    assert_equal '<a href="http://example.com/abc?query=ruby">http://example.com/abc?query=ruby</a>', result
  end

  def test_transform_with_param_and_trailing_dot
    result = auto_html('http://example.com/abc?query=ruby.') { link }
    assert_equal '<a href="http://example.com/abc?query=ruby">http://example.com/abc?query=ruby</a>.', result
  end

  def test_transform_with_anchor_and_trailing_dot
    result = auto_html('http://example.com/example#id=123.12.') { link }
    assert_equal '<a href="http://example.com/example#id=123.12">http://example.com/example#id=123.12</a>.', result
  end

  def test_transform_with_params
    url = 'http://www.youtube.com/watch?v=s5C5Zk4kobo&feature=related'
    # uses auto_link instead raw to support both Rails 2 & 3
    assert_equal(ActionView::Base.new.auto_link(url), auto_html(url) { link })
  end

  def test_transform_with_commas
    result = auto_html('http://www.dw-world.de/dw/article/0,,4708386,00.html?maca=ser-rss-ser-all-1494-rdf') { link }
    assert_equal '<a href="http://www.dw-world.de/dw/article/0,,4708386,00.html?maca=ser-rss-ser-all-1494-rdf">http://www.dw-world.de/dw/article/0,,4708386,00.html?maca=ser-rss-ser-all-1494-rdf</a>', result
  end

  def test_transform_complex_url
    url = 'http://www.google.com/#q=nikola+tesla&ct=tesla09&oi=ddle&fp=Xmf0jJ9P_V0'
    # uses auto_link instead raw to support both Rails 2 & 3
    assert_equal(ActionView::Base.new.auto_link(url), auto_html(url) { link })
  end

  def test_transform_with_options
    result = auto_html("http://rors.org") { link :rel => "nofollow", :target => "_blank" }
    assert_equal '<a href="http://rors.org" rel="nofollow" target="_blank">http://rors.org</a>', result
  end

end