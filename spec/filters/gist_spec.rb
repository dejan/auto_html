require 'spec_helper'

RSpec.describe AutoHtml::Gist do
  it 'converst gist URL to gist script tag' do
    expect(subject.call('https://gist.github.com/171027')).to eq(
      '<script type="text/javascript" src="https://gist.github.com/171027.js">'\
      '</script>')
  end

  it 'converst gist URL with username to gist script tag' do
    expect(subject.call('https://gist.github.com/toctan/654784')).to eq(
      '<script type="text/javascript" src="https://gist.github.com/654784.js">'\
      '</script>')
  end
end
