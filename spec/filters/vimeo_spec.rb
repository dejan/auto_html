require 'spec_helper'

RSpec.describe AutoHtml::Vimeo do
  it 'transform vimeo url' do
    result = subject.call('http://www.vimeo.com/3300155')
    expect(result).to eq '<iframe src="//player.vimeo.com/video/3300155?title=0&byline=0&portrait=0" width="440" height="248" frameborder="0"></iframe>'
  end

  it 'transform vimeo url without www' do
    result = subject.call('http://vimeo.com/3300155')
    expect(result).to eq '<iframe src="//player.vimeo.com/video/3300155?title=0&byline=0&portrait=0" width="440" height="248" frameborder="0"></iframe>'
  end

  it 'transform vimeo https url' do
    result = subject.call('https://vimeo.com/3300155')
    expect(result).to eq '<iframe src="//player.vimeo.com/video/3300155?title=0&byline=0&portrait=0" width="440" height="248" frameborder="0"></iframe>'
  end

  it 'transform vimeo url with params' do
    result = subject.call('http://vimeo.com/3300155?pg=embed&sec=')
    expect(result).to eq '<iframe src="//player.vimeo.com/video/3300155?title=0&byline=0&portrait=0" width="440" height="248" frameborder="0"></iframe>'
  end

  it 'transform vimeo url with anchor' do
    result = subject.call('http://vimeo.com/3300155#skirt')
    expect(result).to eq '<iframe src="//player.vimeo.com/video/3300155?title=0&byline=0&portrait=0" width="440" height="248" frameborder="0"></iframe>'
  end

  it 'transform vimeo url wth options' do
    filter = described_class.new(width: 300, height: 250)
    result = filter.call('http://www.vimeo.com/3300155')
    expect(result).to eq '<iframe src="//player.vimeo.com/video/3300155?title=0&byline=0&portrait=0" width="300" height="250" frameborder="0"></iframe>'
  end

  it 'transform vimeo url with title' do
    filter = described_class.new(width: 300, height: 250, show_title: true)
    result = filter.call('http://www.vimeo.com/3300155')
    expect(result).to eq '<iframe src="//player.vimeo.com/video/3300155?byline=0&portrait=0" width="300" height="250" frameborder="0"></iframe>'
  end

  it 'transform vimeo url with byline option' do
    filter = described_class.new(width: 300, height: 250, show_byline: true)
    result = filter.call('http://www.vimeo.com/3300155')
    expect(result).to eq '<iframe src="//player.vimeo.com/video/3300155?title=0&portrait=0" width="300" height="250" frameborder="0"></iframe>'
  end

  it 'transform vimeo url with portrait option' do
    filter = described_class.new(width: 300, height: 250, show_portrait: true)
    result = filter.call('http://www.vimeo.com/3300155')
    expect(result).to eq '<iframe src="//player.vimeo.com/video/3300155?title=0&byline=0" width="300" height="250" frameborder="0"></iframe>'
  end
end
