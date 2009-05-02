require File.dirname(__FILE__) + '/../spec_helper'

describe AutoHtml do
  it 'should transform URL to Google Video embed markup' do
    auto_html("http://video.google.com/videoplay?docid=-7533500868750350977&ei=Xin8Sc-KBYeg2ALXkKymAQ&q=office+space&emb=1") { google_video }.should == 
      '<object width="650" height="391"><param name="movie" value="http://video.google.com/googleplayer.swf?docid=-7533500868750350977&hl=en&fs=true"></param><param name="wmode" value="transparent"></param><embed src="http://video.google.com/googleplayer.swf?docid=-7533500868750350977" type="application/x-shockwave-flash" wmode="transparent" width="650" height="391"></embed></object>'
  end
  
  it 'should transform URL to Google Video embed markup with tweaked width & height' do
    auto_html("http://video.google.com/videoplay?docid=7442132741322615356") { google_video(:width => 500, :height => 300) }.should == 
      '<object width="500" height="300"><param name="movie" value="http://video.google.com/googleplayer.swf?docid=7442132741322615356&hl=en&fs=true"></param><param name="wmode" value="transparent"></param><embed src="http://video.google.com/googleplayer.swf?docid=7442132741322615356" type="application/x-shockwave-flash" wmode="transparent" width="500" height="300"></embed></object>'
  end
end