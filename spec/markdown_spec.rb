require 'spec_helper'

RSpec.describe AutoHtml::Markdown do
  it 'formats input using simple GFM rules' do
    expect(subject.call '*hello*').to eq "<p><em>hello</em></p>\n"
  end
end
