require 'spec_helper'

RSpec.describe AutoHtml::Emoji do
  it 'converts emoji to HTML' do
    expect(subject.call(':joy:')).to eq(
      '<img src="/images/emoji/unicode/1f602.png" class="emoji" title=":joy:" '\
      'alt=":joy:" height="20" witdh="20" align="absmiddle" />')
  end
end
