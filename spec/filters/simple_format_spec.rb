require File.dirname(__FILE__) + '/../spec_helper'

describe AutoHtml do
  it 'should apply simple_format filter' do

    auto_html("Hey check out my blog => http://rors.org") { simple_format }.should == 
      "<p>Hey check out my blog => http://rors.org</p>"

    auto_html("Hey check out my code => http://github.com/dejan") { simple_format }.should == 
      "<p>Hey check out my code => http://github.com/dejan</p>"

  end
end
