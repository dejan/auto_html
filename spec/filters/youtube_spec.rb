require 'spec_helper'

RSpec.describe AutoHtml::Youtube do
  it 'transforms youtube url' do
    result = subject.call('http://www.youtube.com/watch?v=BwNrmYRiX_o')
    expect(result).to eq '<div class="video youtube"><iframe width="420" height="315" src="//www.youtube.com/embed/BwNrmYRiX_o" frameborder="0" allowfullscreen="yes"></iframe></div>'
  end

  it 'transforms youtube url with lot of params' do
    result = subject.call('http://www.youtube.com/watch?v=BwNrmYRiX_o&eurl=http%3A%2F%2Fvukajlija.com%2Fvideo%2Fklipovi%3Fstrana%3D6&feature=player_embedded') { youtube }
    expect(result).to eq '<div class="video youtube"><iframe width="420" height="315" src="//www.youtube.com/embed/BwNrmYRiX_o" frameborder="0" allowfullscreen="yes"></iframe></div>'
  end

  it 'transforms youtube url ignoring text' do
    result = subject.call('foo http://www.youtube.com/watch?v=fT1ahr81HLw bar') { youtube }
    expect(result).to eq 'foo <div class="video youtube"><iframe width="420" height="315" src="//www.youtube.com/embed/fT1ahr81HLw" frameborder="0" allowfullscreen="yes"></iframe></div> bar'
  end

  it 'transforms youtube url ignoring html tags' do
    result = subject.call('foo http://www.youtube.com/watch?v=fT1ahr81HLw<br>bar') { youtube }
    expect(result).to eq 'foo <div class="video youtube"><iframe width="420" height="315" src="//www.youtube.com/embed/fT1ahr81HLw" frameborder="0" allowfullscreen="yes"></iframe></div><br>bar'
  end

  it 'transforms url without www' do
    result = subject.call('http://youtube.com/watch?v=BwNrmYRiX_o') { youtube }
    expect(result).to eq '<div class="video youtube"><iframe width="420" height="315" src="//www.youtube.com/embed/BwNrmYRiX_o" frameborder="0" allowfullscreen="yes"></iframe></div>'
  end

  it 'transforms using options' do
    filter = described_class.new(width: 300, height: 255, frameborder: 1, wmode: 'window')
    result = filter.call('http://www.youtube.com/watch?v=BwNrmYRiX_o')
    expect(result).to eq '<div class="video youtube"><iframe width="300" height="255" src="//www.youtube.com/embed/BwNrmYRiX_o?wmode=window" frameborder="1" allowfullscreen="yes"></iframe></div>'
  end

  it 'transforms short url' do
    result = subject.call('http://www.youtu.be/BwNrmYRiX_o')
    expect(result).to eq '<div class="video youtube"><iframe width="420" height="315" src="//www.youtube.com/embed/BwNrmYRiX_o" frameborder="0" allowfullscreen="yes"></iframe></div>'
  end

  it 'transforms short url with params' do
    result = subject.call('http://youtu.be/t7NdBIA4zJg?t=1s&hd=1')
    expect(result).to eq '<div class="video youtube"><iframe width="420" height="315" src="//www.youtube.com/embed/t7NdBIA4zJg" frameborder="0" allowfullscreen="yes"></iframe></div>'
  end

  it 'transforms https url' do
    result = subject.call('https://www.youtube.com/watch?v=t7NdBIA4zJg')
    expect(result).to eq '<div class="video youtube"><iframe width="420" height="315" src="//www.youtube.com/embed/t7NdBIA4zJg" frameborder="0" allowfullscreen="yes"></iframe></div>'
  end

  it 'transforms url without protocol' do
    result = subject.call('www.youtube.com/watch?v=t7NdBIA4zJg')
    expect(result).to eq '<div class="video youtube"><iframe width="420" height="315" src="//www.youtube.com/embed/t7NdBIA4zJg" frameborder="0" allowfullscreen="yes"></iframe></div>'
  end
end
