require File.expand_path('../../unit_test_helper', __FILE__)

class ImageTest < Test::Unit::TestCase

  def test_transform
    result = auto_html('http://rors.org/images/rails.png') { image({:alt => nil}) }
    assert_equal '<img src="http://rors.org/images/rails.png" />', result
  end

  def test_dont_transform
    result = auto_html('http://blog.phusion.nl/2009/04/16/phusions-one-year-anniversary-gift-phusion-passenger-220/') { image }
    assert_equal 'http://blog.phusion.nl/2009/04/16/phusions-one-year-anniversary-gift-phusion-passenger-220/', result
  end

  def test_transform2
    result = auto_html('http://farm4.static.flickr.com/3459/3270173112_5099d3d730.jpg') { image({:alt => nil}) }
    assert_equal '<img src="http://farm4.static.flickr.com/3459/3270173112_5099d3d730.jpg" />', result
  end

  def test_transform3
    result = auto_html('http://www.lockhartfineart.com/images/Rio_Grande_Frost.JPG') { image({:alt => nil}) }
    assert_equal '<img src="http://www.lockhartfineart.com/images/Rio_Grande_Frost.JPG" />', result
  end

  def test_transform4
    result = auto_html('http://www.lockhartfineart.com/images/Rio_Grande_Frost.JPG') { image({:alt => nil}) }
    assert_equal '<img src="http://www.lockhartfineart.com/images/Rio_Grande_Frost.JPG" />', result
  end

  def test_transform5
    result = auto_html('http://farm4.static.flickr.com/3664/3512431377_71b8d002ef.jpg?v=0') { image({:alt => nil}) }
    assert_equal '<img src="http://farm4.static.flickr.com/3664/3512431377_71b8d002ef.jpg?v=0" />', result
  end

  def test_transform6
    result = auto_html('Do you like this logo http://rors.org/images/rails.png? Yeah?') { image({:alt => nil}) }
    assert_equal 'Do you like this logo <img src="http://rors.org/images/rails.png" />? Yeah?', result
  end

  def test_transform7
    result = auto_html('http://tbn3.google.com/images?q=tbn:vS-jtEi9Xc8K6M:http://upload.wikimedia.org/wikipedia/commons/b/ba/Potturinn.jpeg') { image({:alt => nil}) }
    assert_equal '<img src="http://tbn3.google.com/images?q=tbn:vS-jtEi9Xc8K6M:http://upload.wikimedia.org/wikipedia/commons/b/ba/Potturinn.jpeg" />', result
  end

  def test_https
    result = auto_html('https://img.skitch.com/20100910-1wrbg5749xe29ya5t3s85bnaiy.png') { image({:alt => nil}) }
    assert_equal '<img src="https://img.skitch.com/20100910-1wrbg5749xe29ya5t3s85bnaiy.png" />', result
  end

end