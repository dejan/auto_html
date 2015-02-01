require File.expand_path('../../unit_test_helper', __FILE__)

class FlickrTest < Minitest::Test

  def test_transform_success
    result = auto_html('https://www.flickr.com/photos/spooky_mayne/15662909077') { flickr }
    assert_equal 'https://www.flickr.com/photos/spooky_mayne/15662909077', result
  end

  def test_bad_url
    result = auto_html('http://www.flickr.com/photos/kenami/to') { flickr }
    assert_equal 'http://www.flickr.com/photos/kenami/to', result
  end

end
