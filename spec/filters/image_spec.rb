require File.dirname(__FILE__) + '/../spec_helper'

describe AutoHtml do
  it 'should transform URL to HTML image' do

    auto_html('http://rors.org/images/rails.png') { image }.should == 
      '<img src="http://rors.org/images/rails.png" alt=""/>'

    auto_html('http://farm4.static.flickr.com/3459/3270173112_5099d3d730.jpg') { image }.should == 
      '<img src="http://farm4.static.flickr.com/3459/3270173112_5099d3d730.jpg" alt=""/>'

    auto_html('http://blog.phusion.nl/2009/04/16/phusions-one-year-anniversary-gift-phusion-passenger-220/') { image }.should_not == 
      '<img src="http://blog.phusion.nl/2009/04/16/phusions-one-year-anniversary-gif" alt=""/>'
      
    auto_html('http://www.lockhartfineart.com/images/Rio_Grande_Frost.JPG') { image }.should == 
      '<img src="http://www.lockhartfineart.com/images/Rio_Grande_Frost.JPG" alt=""/>'

  end
end