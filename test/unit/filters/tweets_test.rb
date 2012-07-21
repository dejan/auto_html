require File.expand_path('../../unit_test_helper', __FILE__)

class TweetsTest < Test::Unit::TestCase

  def test_transform
    result = auto_html('https://twitter.com/twitterapi/status/133640144317198338') { tweets }
    assert_equal '<blockquote class="twitter-tweet"><p>Search API will now always return "real" Twitter user IDs. The with_twitter_user_id parameter is no longer necessary. An era has ended. ^TS</p>&mdash; Twitter API (@twitterapi) <a href="https://twitter.com/twitterapi/status/133640144317198338" data-datetime="2011-11-07T20:21:07+00:00">November 7, 2011</a></blockquote>', result
  end

  def test_transform_with_statues
    result = auto_html('https://twitter.com/twitterapi/statuses/133640144317198338') { tweets }
    assert_equal '<blockquote class="twitter-tweet"><p>Search API will now always return "real" Twitter user IDs. The with_twitter_user_id parameter is no longer necessary. An era has ended. ^TS</p>&mdash; Twitter API (@twitterapi) <a href="https://twitter.com/twitterapi/status/133640144317198338" data-datetime="2011-11-07T20:21:07+00:00">November 7, 2011</a></blockquote>', result
  end

  def test_transform_with_brackets
    result = auto_html('[tweet https://twitter.com/twitterapi/status/133640144317198338]') { tweets }
    assert_equal '<blockquote class="twitter-tweet"><p>Search API will now always return "real" Twitter user IDs. The with_twitter_user_id parameter is no longer necessary. An era has ended. ^TS</p>&mdash; Twitter API (@twitterapi) <a href="https://twitter.com/twitterapi/status/133640144317198338" data-datetime="2011-11-07T20:21:07+00:00">November 7, 2011</a></blockquote>', result
  end

  def test_transform_with_lang
    result = auto_html('https://twitter.com/twitterapi/status/133640144317198338') { tweets(:lang => "pt") }
    assert_equal '<blockquote class="twitter-tweet" lang="pt"><p>Search API will now always return "real" Twitter user IDs. The with_twitter_user_id parameter is no longer necessary. An era has ended. ^TS</p>&mdash; Twitter API (@twitterapi) <a href="https://twitter.com/twitterapi/status/133640144317198338" data-datetime="2011-11-07T20:21:07+00:00">novembro 7, 2011</a></blockquote>', result
  end

  def test_transform_with_align
    result = auto_html('https://twitter.com/twitterapi/status/133640144317198338') { tweets(:align => "center") }
    assert_equal '<blockquote class="twitter-tweet tw-align-center"><p>Search API will now always return "real" Twitter user IDs. The with_twitter_user_id parameter is no longer necessary. An era has ended. ^TS</p>&mdash; Twitter API (@twitterapi) <a href="https://twitter.com/twitterapi/status/133640144317198338" data-datetime="2011-11-07T20:21:07+00:00">November 7, 2011</a></blockquote>', result
  end

  def test_transform_with_omit_script
    result = auto_html('https://twitter.com/twitterapi/status/133640144317198338') { tweets(:omit_script => false) }
    assert_equal '<blockquote class="twitter-tweet"><p>Search API will now always return "real" Twitter user IDs. The with_twitter_user_id parameter is no longer necessary. An era has ended. ^TS</p>&mdash; Twitter API (@twitterapi) <a href="https://twitter.com/twitterapi/status/133640144317198338" data-datetime="2011-11-07T20:21:07+00:00">November 7, 2011</a></blockquote>
<script src="//platform.twitter.com/widgets.js" charset="utf-8"></script>', result
  end

  def test_transform_with_another_profile
    result = auto_html('https://twitter.com/JosemarLuedke/status/222383787919683585') { tweets }
    assert_equal '<blockquote class="twitter-tweet"><p>Catarse.me <a href="http://t.co/V6WQSy5c" title="http://instagr.am/p/M3mQxEMZNQ/">instagr.am/p/M3mQxEMZNQ/</a></p>&mdash; Josemar Davi Luedke (@JosemarLuedke) <a href="https://twitter.com/JosemarLuedke/status/222383787919683585" data-datetime="2012-07-09T17:36:41+00:00">July 9, 2012</a></blockquote>', result
  end

end
