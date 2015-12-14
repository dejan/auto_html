require 'spec_helper'

RSpec.describe AutoHtml::Image do
  it 'transforms an image link to image tag' do
    result = subject.call('http://rors.org/images/rails.png')
    expect(result).to eq('<img src="http://rors.org/images/rails.png" />')
  end

  it 'transforms image link with a param to image tag' do
    result = subject.call('http://farm4.static.flickr.com/3664/3512431377_71b8d002ef.jpg?v=0')
    expect(result).to eq('<img src="http://farm4.static.flickr.com/3664/3512431377_71b8d002ef.jpg?v=0" />')
  end

  it 'transforms image link on https to image tag' do
    result = subject.call('https://img.skitch.com/20100910-1wrbg5749xe29ya5t3s85bnaiy.png')
    expect(result).to eq('<img src="https://img.skitch.com/20100910-1wrbg5749xe29ya5t3s85bnaiy.png" />')
  end

  it 'transforms image link to a image tag with proxy as source' do
    filter = AutoHtml::Image.new(proxy: 'https://proxy/?url=')
    result = filter.call('http://img.skitch.com/20100910-1wrbg5749xe29ya5t3s85bnaiy.png')
    expect(result).to eq('<img src="https://proxy/?url=http://img.skitch.com/20100910-1wrbg5749xe29ya5t3s85bnaiy.png" />')
  end

  it 'does not transforms already transformed image' do
    result = subject.call('<img src="http://farm4.static.flickr.com/3459/3270173112_5099d3d730.jpg" />')
    expect(result).to eq('<img src="http://farm4.static.flickr.com/3459/3270173112_5099d3d730.jpg" />')
  end

  it 'transforms an image link within text to image tag' do
    result = subject.call('Which do you prefer, this one http://www.lockhartfineart.com/images/Rio_Grande_Frost.JPG, or this one http://rors.org/images/rails.png?')
    expect(result).to eq('Which do you prefer, this one <img src="http://www.lockhartfineart.com/images/Rio_Grande_Frost.JPG" />, or this one <img src="http://rors.org/images/rails.png" />?')
  end

  it 'transforms an image link with a lot of param to image tag' do
    result = subject.call('http://tbn3.google.com/images?q=tbn:vS-jtEi9Xc8K6M:http://upload.wikimedia.org/wikipedia/commons/b/ba/Potturinn.jpeg')
    expect(result).to eq('<img src="http://tbn3.google.com/images?q=tbn:vS-jtEi9Xc8K6M:http://upload.wikimedia.org/wikipedia/commons/b/ba/Potturinn.jpeg" />')
  end
end
