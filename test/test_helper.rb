require 'rubygems'
require 'bundler'
Bundler.setup

require 'active_record'
require 'action_view'
require 'active_support'
require 'active_support/core_ext/class'

require 'minitest'
require 'minitest/focus'

require File.dirname(__FILE__) + '/../init'

require 'minitest/reporters'
MiniTest::Reporters.use!