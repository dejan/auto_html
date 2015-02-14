require 'spec_helper'

RSpec.describe AutoHtml::SimpleFormat do
  it 'formats input using simple rules' do
    result = subject.call('Hey check out my blog => http://rors.org')
    expect(result).to eq '<p>Hey check out my blog => http://rors.org</p>'

    expect(subject.call(nil)).to eq '<p></p>'

    expect(subject.call("crazy\r\n cross\r platform linebreaks")).to eq "<p>crazy\n<br /> cross\n<br /> platform linebreaks</p>"
    expect(subject.call("A paragraph\n\nand another one!")).to eq "<p>A paragraph</p>\n\n<p>and another one!</p>"
    expect(subject.call("A paragraph\n With a newline")).to eq "<p>A paragraph\n<br /> With a newline</p>"

    expect(subject.call("A\nB\nC\nD")).to eq "<p>A\n<br />B\n<br />C\n<br />D</p>"

    expect(subject.call("A\r\n  \nB\n\n\r\n\t\nC\nD")).to eq "<p>A\n<br />  \n<br />B</p>\n\n<p>\t\n<br />C\n<br />D</p>"

    filter = described_class.new(html_options: { class: 'test' })
    expect(filter.call('This is a classy test')).to eq '<p class="test">This is a classy test</p>'
    expect(filter.call("This is also\n\nvery classy")).to eq %(<p class="test">This is also</p>\n\n<p class="test">very classy</p>)
  end
end
