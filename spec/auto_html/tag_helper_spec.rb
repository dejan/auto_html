# frozen_string_literal: true

require 'spec_helper'

RSpec.describe AutoHtml::TagHelper do
  it 'generates tag with attributes' do
    result = subject.tag(:img, src: '1.png', alt: 'number one!')
    expect(result).to eq '<img src="1.png" alt="number one!" />'
  end

  it 'generates tag without attributes' do
    result = subject.tag(:br)
    expect(result).to eq '<br />'
  end

  it 'generates content tags' do
    result = subject.tag(:label, for: 'name') { 'Name' }
    expect(result).to eq '<label for="name">Name</label>'
  end

  it 'generates content tags without attributes' do
    result = subject.tag(:label) { 'Username' }
    expect(result).to eq '<label>Username</label>'
  end

  it 'generates nested tags' do
    result = subject.tag(:form) { subject.tag(:input, type: 'text') }
    expect(result).to eq '<form><input type="text" /></form>'
  end
end
