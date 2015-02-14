require 'spec_helper'

RSpec.describe AutoHtml::Format do
  subject { described_class.new(AutoHtml::SimpleFormat, AutoHtml::Image.new(alt: nil), AutoHtml::Link) }

  it 'does not transforms input when no filters provided' do
    input  = 'Hey check out my blog => http://rors.org'
    result = described_class.new.call(input)
    expect(result).to eq input
  end

  it 'transforms input using provided filters' do
    result = subject.call 'Check the logo: http://rors.org/images/rails.png. Visit: http://rubyonrails.org'
    expect(result).to eq '<p>Check the logo: <img src="http://rors.org/images/rails.png" alt="" />. Visit: <a href="http://rubyonrails.org" >http://rubyonrails.org</a></p>'
  end

  it 'is blank if input is blank' do
    expect(subject.call '').to eq ''
  end

  it 'is blank if input is nil' do
    expect(subject.call nil).to eq ''
  end
end
