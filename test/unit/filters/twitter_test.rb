require File.expand_path('../../unit_test_helper', __FILE__)
require 'fakeweb'

class TwitterTest < Test::Unit::TestCase

  def setup
    response = %Q(
      {
        "author_name": "Dan Martell",
        "author_url": "https://twitter.com/danmartell",
        "cache_age": "3153600000",
        "height": null,
        "html": "things",
        "provider_name": "Twitter",
        "provider_url": "https://twitter.com",
        "type": "rich",
        "url": "https://twitter.com/danmartell/statuses/279651488517738496",
        "version": "1.0",
        "width": 550
    })

    FakeWeb.register_uri(:get, %r|https://api\.twitter\.com/1/statuses/oembed\.json|, :body => response)
  end

  def test_transform
    transformed_html = "things"
    result = auto_html('https://twitter.com/danmartell/statuses/279651488517738496') { twitter }
    assert_equal transformed_html, result
  end

  def test_transform_with_dangling_slash
    transformed_html = "things"
    result = auto_html('https://twitter.com/danmartell/statuses/279651488517738496/') { twitter }
    assert_equal transformed_html, result
  end

  def test_dont_transform_a_regular_link_to_twitter
    transformed_html = %Q(<blockquote class="twitter-tweet"><p>Stop saying you can&#39;t! Start asking &quot;What would need to be true for me to accomplish this&quot; - it&#39;ll change your life. <a href="https://twitter.com/search?q=%23focus&amp;src=hash">#focus</a> <a href="https://twitter.com/search?q=%23solutions&amp;src=hash">#solutions</a></p>&mdash; Dan Martell (@danmartell) <a href="https://twitter.com/danmartell/statuses/279651488517738496">December 14, 2012</a></blockquote>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>)
    result = auto_html(transformed_html) { twitter }

    assert_equal transformed_html, result
  end

end