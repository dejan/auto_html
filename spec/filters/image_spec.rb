require File.dirname(__FILE__) + '/../spec_helper'

describe AutoHtml do
  it 'should transform URL to HTML image' do

    auto_html('http://rors.org/images/rails.png') { image }.should == 
      '<img src="http://rors.org/images/rails.png" alt=""/>'

  end
end