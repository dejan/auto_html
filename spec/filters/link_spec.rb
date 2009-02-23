require File.dirname(__FILE__) + '/../spec_helper'

describe AutoHtml do
  it 'should transform URL to HTML links' do
    auto_html("http://vukajlija.com") { link }.
      should == '<a href="http://vukajlija.com">http://vukajlija.com</a>'
  end
  
  it 'should transform URL to HTML links with html options' do
    auto_html("http://rors.org") do |auto| 
      auto.link :rel => "nofollow", :target => "_blank"
    end.
      should == '<a href="http://rors.org" rel="nofollow" target="_blank">http://rors.org</a>'
  end
end