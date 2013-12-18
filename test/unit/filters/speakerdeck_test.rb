require File.expand_path('../../unit_test_helper', __FILE__)
require 'fakeweb'

class SpeakerDeckTest < Test::Unit::TestCase

  def setup
    response = '{"type":"rich","version":1.0,"provider_name":"Speaker Deck","provider_url":"https://speakerdeck.com/","title":"Git: the NoSQL Database","author_name":"Brandon Keepers","author_url":"https://speakerdeck.com/bkeepers","html":"\u003Ciframe allowfullscreen=\"true\" allowtransparency=\"true\" frameborder=\"0\" height=\"463\" id=\"talk_frame_10986\" mozallowfullscreen=\"true\" src=\"//speakerdeck.com/player/4f926da9cb4cd0001f00a1ff\" style=\"border:0; padding:0; margin:0; background:transparent;\" webkitallowfullscreen=\"true\" width=\"710\"\u003E\u003C/iframe\u003E\n","width":710,"height":463}'
    FakeWeb.register_uri(:get, %r{http://speakerdeck.com/oembed}, :body => response)
  end

  def test_transform
    result = auto_html('https://speakerdeck.com/bkeepers/git-the-nosql-database') { speakerdeck }
    assert_equal '<iframe allowfullscreen="true" allowtransparency="true" frameborder="0" height="463" id="talk_frame_10986" mozallowfullscreen="true" src="//speakerdeck.com/player/4f926da9cb4cd0001f00a1ff" style="border:0; padding:0; margin:0; background:transparent;" webkitallowfullscreen="true" width="710"></iframe>', result
  end
end
