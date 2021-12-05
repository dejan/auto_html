# frozen_string_literal: true

require 'demo'
require 'rack/test'

describe Demo do
  include Rack::Test::Methods

  subject(:app) { Demo }

  it 'responds OK for root path' do
    get '/'
    expect(last_response).to be_ok
  end

  it 'responds with formatted code' do
    post '/auto-html', { text: 'Hello', filters: ['simple_format'] }
    expect(last_response).to be_ok
    expect(last_response.body).to eq('<p>Hello</p>')
  end
end
