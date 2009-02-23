require File.dirname(__FILE__) + '/../spec_helper'

describe AutoHtml do
  it 'should transform URL to Deezer embed markup' do

    auto_html("http://www.deezer.com/track/1053417") { deezer }.should == 
      '<object width="220" height="55"><param name="movie" value="http://www.deezer.com/embedded/small-widget-v2.swf?idSong=1053417&colorBackground=0x555552&textColor1=0xFFFFFF&colorVolume=0x39D1FD&autoplay=0"></param><embed src="http://www.deezer.com/embedded/small-widget-v2.swf?idSong=1053417&colorBackground=0x525252&textColor1=0xFFFFFF&colorVolume=0x39D1FD&autoplay=0" type="application/x-shockwave-flash" width="220" height="55"></embed></object>'

    auto_html("http://www.deezer.com/track/30053") { deezer }.should == 
      '<object width="220" height="55"><param name="movie" value="http://www.deezer.com/embedded/small-widget-v2.swf?idSong=30053&colorBackground=0x555552&textColor1=0xFFFFFF&colorVolume=0x39D1FD&autoplay=0"></param><embed src="http://www.deezer.com/embedded/small-widget-v2.swf?idSong=30053&colorBackground=0x525252&textColor1=0xFFFFFF&colorVolume=0x39D1FD&autoplay=0" type="application/x-shockwave-flash" width="220" height="55"></embed></object>'

  end
end