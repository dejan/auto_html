require 'rubygems'

rails_version = ENV['RAILS_VERSION']
if rails_version
  gem "activerecord", rails_version
  gem "actionpack", rails_version
end

require 'test/unit'
require 'active_record'
require 'active_support/core_ext/class'

require File.dirname(__FILE__) + '/../init'

