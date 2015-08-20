require 'rubygems'
require 'bundler'
Bundler.setup

require 'active_record'
require 'action_view'
require 'active_support'
require 'active_support/core_ext/class'

require File.dirname(__FILE__) + '/../init'

require 'minitest'
require 'minitest/reporters'
#require 'minitest/focus'

reporter_opts = {color: true, slow_count: 5}

Minitest::Reporters.use!(
  [
    Minitest::Reporters::DefaultReporter.new(reporter_opts)
  ]
)