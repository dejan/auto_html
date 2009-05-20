require File.dirname(__FILE__) + '/../spec_helper'

describe AutoHtml do
  it 'should transform URL to YouTube embed markup' do

    auto_html("http://www.youtube.com/watch?v=BwNrmYRiX_o") { youtube }.should == 
      '<object width="390" height="250"><param name="movie" value="http://www.youtube.com/v/BwNrmYRiX_o"></param><param name="wmode" value="transparent"></param><embed src="http://www.youtube.com/v/BwNrmYRiX_o" type="application/x-shockwave-flash" wmode="transparent" width="390" height="250"></embed></object>'

    auto_html("http://www.youtube.com/watch?v=3-ewi9saKg8&eurl=http%3A%2F%2Fvukajlija.com%2Fvideo%2Fklipovi%3Fstrana%3D6&feature=player_embedded") { youtube }.should == 
      '<object width="390" height="250"><param name="movie" value="http://www.youtube.com/v/3-ewi9saKg8"></param><param name="wmode" value="transparent"></param><embed src="http://www.youtube.com/v/3-ewi9saKg8" type="application/x-shockwave-flash" wmode="transparent" width="390" height="250"></embed></object>'

    auto_html("http://www.youtube.com/watch?v=Mw8KJ29qph0&feature=related") { youtube }.should == 
      '<object width="390" height="250"><param name="movie" value="http://www.youtube.com/v/Mw8KJ29qph0"></param><param name="wmode" value="transparent"></param><embed src="http://www.youtube.com/v/Mw8KJ29qph0" type="application/x-shockwave-flash" wmode="transparent" width="390" height="250"></embed></object>'

  end
  
  it 'should transform URL (without www.) to YouTube embed markup' do

    auto_html("http://youtube.com/watch?v=BwNrmYRiX_o") { youtube }.should == 
      '<object width="390" height="250"><param name="movie" value="http://www.youtube.com/v/BwNrmYRiX_o"></param><param name="wmode" value="transparent"></param><embed src="http://www.youtube.com/v/BwNrmYRiX_o" type="application/x-shockwave-flash" wmode="transparent" width="390" height="250"></embed></object>'

  end
  
  it 'should transform URL to YouTube embed markup with tweaked width & height' do

    auto_html("http://www.youtube.com/watch?v=ZA1NoOOoaNw") { youtube(:width => 300, :height => 250) }.should == 
      '<object width="300" height="250"><param name="movie" value="http://www.youtube.com/v/ZA1NoOOoaNw"></param><param name="wmode" value="transparent"></param><embed src="http://www.youtube.com/v/ZA1NoOOoaNw" type="application/x-shockwave-flash" wmode="transparent" width="300" height="250"></embed></object>'

  end
end