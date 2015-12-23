require 'spec_helper'

RSpec.describe AutoHtml::HtmlEscape do
  it 'escapes html tags' do
    result = subject.call('<script>alert(0)</script>')
    expect(result).to eq '&lt;script&gt;alert(0)&lt;/script&gt;'
  end
end
