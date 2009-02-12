require File.dirname(__FILE__) + '/../spec_helper'

describe AutoHtml do
  it 'should transform URL to HTML links' do
    auto_html("http://vukajlija.com") { link }.
      should == '<a href="http://vukajlija.com">http://vukajlija.com</a>'
  end
  
  it 'should transform URL to HTML links with html options' do
    auto_html("http://vukajlija.com") do |auto| 
      auto.link :rel => "nofollow", :target => "_blank"
    end.
      should == '<a href="http://vukajlija.com" rel="nofollow" target="_blank">http://vukajlija.com</a>'
  end
end