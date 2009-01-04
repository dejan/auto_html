require File.dirname(__FILE__) + '/../spec_helper'

describe AutoHtml do
  include AutoHtml::Filters

  it 'should transform URL to HTML links' do
    auto_html_transform_link("http://vukajlija.com").should == '<a href="http://vukajlija.com" rel="nofollow" target="_blank">http://vukajlija.com</a>'
  end
end