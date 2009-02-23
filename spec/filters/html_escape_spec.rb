require File.dirname(__FILE__) + '/../spec_helper'

describe AutoHtml do
  it 'should apply html_escape filter' do

    auto_html("<script>alert(0)</script>") { html_escape }.should == 
      "&lt;script&gt;alert(0)&lt;/script&gt;"

    auto_html("<div>test</div>") { html_escape }.should == 
      "&lt;div&gt;test&lt;/div&gt;"

  end
end
