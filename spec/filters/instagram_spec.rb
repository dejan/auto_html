require 'spec_helper'

RSpec.describe AutoHtml::Instagram do
  it 'transforms instagram URL to image tag' do
    result = subject.call('http://instagram.com/p/WsQTLAGvx7/')
    expect(result).to eq '<iframe src="http://instagram.com/p/WsQTLAGvx7/embed" height="714" width="616" frameborder="0" scrolling="no"></iframe>'
  end
end
