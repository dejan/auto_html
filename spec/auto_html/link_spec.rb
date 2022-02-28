# frozen_string_literal: true

require 'spec_helper'

RSpec.describe AutoHtml::Link do
  it 'transforms URL to a link' do
    result = subject.call('<a href="https://www.ruby-lang.org/en/" >https://www.ruby-lang.org/en/</a>')
    expect(result).to eq '<a href="https://www.ruby-lang.org/en/" >https://www.ruby-lang.org/en/</a>'
  end

  it 'transforms URL with param to a link' do
    result = subject.call('http://example.com/abc?query=ruby')
    expect(result).to eq '<a href="http://example.com/abc?query=ruby">http://example.com/abc?query=ruby</a>'
  end

  it 'transforms URL with param and a trailing dot' do
    result = subject.call('http://example.com/abc?query=ruby.')
    expect(result).to eq '<a href="http://example.com/abc?query=ruby">http://example.com/abc?query=ruby</a>.'
  end

  it 'transforms URL with anchor and a trailing dot' do
    result = subject.call('http://example.com/example#id=123.12.')
    expect(result).to eq '<a href="http://example.com/example#id=123.12">http://example.com/example#id=123.12</a>.'
  end

  it 'transforms URL with commas' do
    result = subject.call('http://www.dw-world.de/dw/article/0,,4708386,00.html?maca=ser-rss-ser-all-1494-rdf')
    expect(result).to eq '<a href="http://www.dw-world.de/dw/article/0,,4708386,00.html?maca=ser-rss-ser-all-1494-rdf">http://www.dw-world.de/dw/article/0,,4708386,00.html?maca=ser-rss-ser-all-1494-rdf</a>'
  end

  it 'transforms complex URL' do
    result = subject.call('http://www.google.com/#q=nikola+tesla&ct=tesla09&oi=ddle&fp=Xmf0jJ9P_V0')
    expect(result).to eq '<a href="http://www.google.com/#q=nikola+tesla&ct=tesla09&oi=ddle&fp=Xmf0jJ9P_V0">http://www.google.com/#q=nikola+tesla&ct=tesla09&oi=ddle&fp=Xmf0jJ9P_V0</a>'
  end

  it 'not transforms short domain URL' do
    result = subject.call('http://localhost:3000')
    expect(result).to eq 'http://localhost:3000'
  end

  it 'transforms with target options' do
    filter = described_class.new(target: '_blank')
    result = filter.call('http://rors.org')
    expect(result).to eq '<a href="http://rors.org" target="_blank">http://rors.org</a>'
  end

  it 'transforms with rel options' do
    filter = described_class.new(rel: 'nofollow')
    result = filter.call('http://rors.org')
    expect(result).to eq '<a href="http://rors.org" rel="nofollow">http://rors.org</a>'
  end

  it 'transforms with short_domains options' do
    filter = described_class.new(short_domains: true)
    result = filter.call('http://localhost:3000')
    expect(result).to eq '<a href="http://localhost:3000">http://localhost:3000</a>'
  end

  it 'transforms with target and rel options' do
    filter = described_class.new(target: '_blank', rel: 'nofollow')
    result = filter.call('http://rors.org')
    expect(result).to eq '<a href="http://rors.org" target="_blank" rel="nofollow">http://rors.org</a>'
  end
end
