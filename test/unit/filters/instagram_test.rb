require File.expand_path('../../unit_test_helper', __FILE__)

class InstagramTest < Test::Unit::TestCase
    
  def test_transform_url_without_www
    result = auto_html('http://instagram.com/p/WsQTLAGvx7/') { instagram }
    assert_equal '<img src="http://distilleryimage3.instagram.com/689fb0a489c611e2bbd422000a1f9ab2_7.jpg" alt="Dutchez enjoying the snow!! #dutchez #island #restday" width="612" height="612">', result
  end
  
  def test_transform_url_with_www
    result = auto_html('http://www.instagram.com/p/WsQTLAGvx7/') { instagram }
    assert_equal '<img src="http://distilleryimage3.instagram.com/689fb0a489c611e2bbd422000a1f9ab2_7.jpg" alt="Dutchez enjoying the snow!! #dutchez #island #restday" width="612" height="612">', result
  end
  
  def test_transform_short_url
    result = auto_html('http://instagr.am/p/WsQTLAGvx7/') { instagram }
    assert_equal '<img src="http://distilleryimage3.instagram.com/689fb0a489c611e2bbd422000a1f9ab2_7.jpg" alt="Dutchez enjoying the snow!! #dutchez #island #restday" width="612" height="612">', result
  end
  
  def test_transform_with_size_option
    result = auto_html('http://instagr.am/p/WsQTLAGvx7/') { instagram(:size => 'small') }
    assert_equal '<img src="http://distilleryimage3.instagram.com/689fb0a489c611e2bbd422000a1f9ab2_7.jpg" alt="Dutchez enjoying the snow!! #dutchez #island #restday" width="150" height="150">', result
    
  end
  
  def test_transform_with_size_link_option
    result = auto_html('http://instagr.am/p/WsQTLAGvx7/') { instagram(:size => 'medium', :link_options => {:add_link => 'true', :target => "_blank" }) }
    assert_equal '<a href="http://instagr.am/p/WsQTLAGvx7/" title="Dutchez enjoying the snow!! #dutchez #island #restday" target="_blank"><img src="http://distilleryimage3.instagram.com/689fb0a489c611e2bbd422000a1f9ab2_7.jpg" alt="Dutchez enjoying the snow!! #dutchez #island #restday" width="306" height="306"></a>', result
  end
  
  def test_transform_with_link_option
     result = auto_html('http://instagr.am/p/WsQTLAGvx7/') { instagram(:link_options => {:add_link => 'true', :target => "_blank" }) }
     assert_equal '<a href="http://instagr.am/p/WsQTLAGvx7/" title="Dutchez enjoying the snow!! #dutchez #island #restday" target="_blank"><img src="http://distilleryimage3.instagram.com/689fb0a489c611e2bbd422000a1f9ab2_7.jpg" alt="Dutchez enjoying the snow!! #dutchez #island #restday" width="612" height="612"></a>', result
  end
  
  def test_transform_with_link_option_no_target
     result = auto_html('http://instagr.am/p/WsQTLAGvx7/') { instagram(:link_options => {:add_link => 'true' }) }
     assert_equal '<a href="http://instagr.am/p/WsQTLAGvx7/" title="Dutchez enjoying the snow!! #dutchez #island #restday" target="_self"><img src="http://distilleryimage3.instagram.com/689fb0a489c611e2bbd422000a1f9ab2_7.jpg" alt="Dutchez enjoying the snow!! #dutchez #island #restday" width="612" height="612"></a>', result
  end
    
end