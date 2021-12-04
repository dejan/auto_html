# frozen_string_literal: true

require 'spec_helper'

RSpec.describe AutoHtml::Emoji do
  it 'converts emoji to HTML' do
    expect(subject.call(':joy:')).to eq('😂')
  end
end
