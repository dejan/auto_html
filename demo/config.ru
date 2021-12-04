# frozen_string_literal: true

require 'rubygems'
require 'bundler'

Bundler.require

require './lib/demo'

run Demo.freeze.app
