require File.dirname(__FILE__) + '/../spec_helper'

describe AutoHtml do
  include AutoHtml::Filters::Link

  it 'should transform URL to HTML links' do
    auto_link("http://vukajlija.com").should == '<a href="http://vukajlija.com">http://vukajlija.com</a>'
  end
end