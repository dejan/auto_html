require File.expand_path('../../unit_test_helper', __FILE__)

class GoogleMapTest < Test::Unit::TestCase

  def test_transform
    result = auto_html('http://maps.google.co.kr/maps?q=%ED%8C%8C%ED%8A%B8%EB%84%88%EC%8A%A4%ED%83%80%EC%9B%8C+1%EC%B0%A8&hl=ko&ie=UTF8&ll=37.472942,126.884762&spn=0.00774,0.010053&sll=37.473027,126.88451&sspn=0.003887,0.005026&vpsrc=6&gl=kr&hq=%ED%8C%8C%ED%8A%B8%EB%84%88%EC%8A%A4%ED%83%80%EC%9B%8C+1%EC%B0%A8&t=m&z=17&iwloc=A') { google_map }
    assert_equal '<iframe width="420" height="315" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="//maps.google.co.kr/maps?f=q&amp;source=s_q&amp;q=%ED%8C%8C%ED%8A%B8%EB%84%88%EC%8A%A4%ED%83%80%EC%9B%8C+1%EC%B0%A8&hl=ko&ie=UTF8&ll=37.472942,126.884762&spn=0.00774,0.010053&sll=37.473027,126.88451&sspn=0.003887,0.005026&vpsrc=6&gl=kr&hq=%ED%8C%8C%ED%8A%B8%EB%84%88%EC%8A%A4%ED%83%80%EC%9B%8C+1%EC%B0%A8&t=m&z=17&iwloc=A&amp;output=embed&amp;t=m&amp;z=18"></iframe><br /><small><a href="//maps.google.co.kr/maps?f=q&amp;source=embed&amp;q=%ED%8C%8C%ED%8A%B8%EB%84%88%EC%8A%A4%ED%83%80%EC%9B%8C+1%EC%B0%A8&hl=ko&ie=UTF8&ll=37.472942,126.884762&spn=0.00774,0.010053&sll=37.473027,126.88451&sspn=0.003887,0.005026&vpsrc=6&gl=kr&hq=%ED%8C%8C%ED%8A%B8%EB%84%88%EC%8A%A4%ED%83%80%EC%9B%8C+1%EC%B0%A8&t=m&z=17&iwloc=A" style="color:#000;text-align:left">View Larger Map</a></small>', result
  end

  def test_transform_2
    result = auto_html('http://maps.google.com/maps?hl=en&q=newyork&gs_sm=e&gs_upl=917l917l0l1666l1l1l0l0l0l0l317l317l3-1l1l0&bav=on.2,or.r_gc.r_pw.,cf.osb&biw=1280&bih=679&um=1&ie=UTF-8&sa=N&tab=wl') { google_map }
    assert_equal '<iframe width="420" height="315" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="//maps.google.com/maps?f=q&amp;source=s_q&amp;hl=en&q=newyork&gs_sm=e&gs_upl=917l917l0l1666l1l1l0l0l0l0l317l317l3-1l1l0&bav=on.2,or.r_gc.r_pw.,cf.osb&biw=1280&bih=679&um=1&ie=UTF-8&sa=N&tab=wl&amp;output=embed&amp;t=m&amp;z=18"></iframe><br /><small><a href="//maps.google.com/maps?f=q&amp;source=embed&amp;hl=en&q=newyork&gs_sm=e&gs_upl=917l917l0l1666l1l1l0l0l0l0l317l317l3-1l1l0&bav=on.2,or.r_gc.r_pw.,cf.osb&biw=1280&bih=679&um=1&ie=UTF-8&sa=N&tab=wl" style="color:#000;text-align:left">View Larger Map</a></small>', result
  end

  def test_show_info
    result = auto_html('http://maps.google.com.br/maps?q=Joinville+-+Santa+Catarina') { google_map(:show_info => false) }
    assert_equal '<iframe width="420" height="315" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="//maps.google.com.br/maps?f=q&amp;source=s_q&amp;q=Joinville+-+Santa+Catarina&amp;output=embed&amp;iwloc=near&amp;t=m&amp;z=18"></iframe><br /><small><a href="//maps.google.com.br/maps?f=q&amp;source=embed&amp;q=Joinville+-+Santa+Catarina" style="color:#000;text-align:left">View Larger Map</a></small>', result
  end

  def test_type_and_zoom
    result = auto_html('http://maps.google.com.br/maps?q=Joinville+-+Santa+Catarina') { google_map(:type => :satellite, :zoom => 3) }
    assert_equal '<iframe width="420" height="315" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="//maps.google.com.br/maps?f=q&amp;source=s_q&amp;q=Joinville+-+Santa+Catarina&amp;output=embed&amp;t=k&amp;z=3"></iframe><br /><small><a href="//maps.google.com.br/maps?f=q&amp;source=embed&amp;q=Joinville+-+Santa+Catarina" style="color:#000;text-align:left">View Larger Map</a></small>', result
  end
end
