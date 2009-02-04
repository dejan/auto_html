require File.join(File.dirname(__FILE__), 'spec_helper')

describe AutoHtml do
  it 'should not change anything if no filters provided' do
    auto_html("Hey check out my blog => http://rors.org", []).should == 
      "Hey check out my blog => http://rors.org"
  end
  
  it 'should apply simple_format filter' do
    auto_html("Hey check out my blog => http://rors.org", :simple_format).should == 
      "<p>Hey check out my blog => http://rors.org</p>"
  end
  
  it 'should apply simple_format and image filter' do
    auto_html("Check the logo: http://rors.org/images/rails.png", [:simple_format, :image]).should == 
      '<p>Check the logo: <img src="http://rors.org/images/rails.png" alt=""/></p>'
  end
  
  it 'should apply simple_format, image and link filter ' do
    auto_html("Check the logo: http://rors.org/images/rails.png. Visit: http://rubyonrails.org", [:simple_format, :image, :link]).should == 
      '<p>Check the logo: <img src="http://rors.org/images/rails.png" alt=""/>. Visit: <a href="http://rubyonrails.org" rel="nofollow" target="_blank">http://rubyonrails.org</a></p>'
  end
end