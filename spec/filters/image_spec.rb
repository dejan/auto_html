require File.dirname(__FILE__) + '/../spec_helper'

describe AutoHtml do
  include AutoHtml::Filters

  it 'should transform URL to HTML image' do
    auto_html_transform_image('http://rors.org/images/rails.png').should == '<img src="http://rors.org/images/rails.png" alt=""/>'
  end
end