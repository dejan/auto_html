require File.expand_path('../../unit_test_helper', __FILE__)
require 'fakeweb'

class TwitterTest < Test::Unit::TestCase

  def setup
    response = %Q(
      {
        "type": "rich",
        "url": "http://twitter.com/danmartell/status/279651488517738496",
        "cache_age": "31536000000",
        "height": null,
        "html": "things",
        "version": "1.0",
        "provider_name": "Twitter",
        "width": 550,
        "provider_url": "http://twitter.com",
        "author_name": "Dan Martell",
        "author_url": "http://twitter.com/danmartell"
    })
    
    FakeWeb.register_uri(:get, %r|http://api\.twitter\.com/1/statuses/oembed\.json|, :body => response)
  end

  def test_transform
    transormed_html = "things"
    result = auto_html('https://twitter.com/danmartell/statuses/279651488517738496') { twitter }
    assert_equal transormed_html, result
  end

  def test_dont_transform_a_regular_link_to_twitter
    transormed_html = %Q(<blockquote class="twitter-tweet"><p>Stop saying you can't! Start asking "What would need to be true for me to accomplish this" - it'll change your life. <a href="https://twitter.com/search/%23focus">#focus</a> <a href="https://twitter.com/search/%23solutions">#solutions</a></p>&mdash; Dan Martell (@danmartell) <a href="https://twitter.com/danmartell/status/279651488517738496" data-datetime="2012-12-14T18:18:05+00:00">December 14, 2012</a></blockquote>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>)

    result = auto_html(transormed_html) { twitter }

    assert_equal transormed_html, result
  end

end