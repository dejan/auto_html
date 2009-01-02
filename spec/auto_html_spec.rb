require File.dirname(__FILE__) + '/spec_helper'

describe AutoHtml do
  include AutoHtml::InstanceMethods

  it 'should transform text to HTML auto converting URLs to appropriate markup' do
    do_auto_html("test").should == '<p>test</p>' 

    do_auto_html("Hey check out my blog => http://rors.org").should == 
      '<p>Hey check out my blog => <a href="http://rors.org" rel="nofollow" target="_blank">http://rors.org</a></p>' 

    do_auto_html("On my blog http://rors.org I've posted this track: http://www.youtube.com/watch?v=BwNrmYRiX_o").should == 
      %|<p>On my blog <a href="http://rors.org" rel="nofollow" target="_blank">http://rors.org</a> I've posted this track:<object width="390" height="250"><param name="movie" value="http://www.youtube.com/v/BwNrmYRiX_o"></param><param name="wmode" value="transparent"></param><embed src="http://www.youtube.com/v/BwNrmYRiX_o" type="application/x-shockwave-flash" wmode="transparent" width="390" height="250"></embed></object></p>|
  end
end