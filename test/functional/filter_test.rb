require File.expand_path('../../test_helper', __FILE__)
require File.expand_path('../../fixture_setup', __FILE__)

AutoHtml.add_filter(:foo) do |text|
  nil
end

AutoHtml.add_filter(:bar) do |text|
  "bar"
end

class User < ActiveRecord::Base
  auto_html_for :bio do
    foo
    foo
    bar
  end
end

class FilterTest < Test::Unit::TestCase
  include FixtureSetup

  def test_transform_after_save
    @article = User.new(:bio => 'in progress...')
    assert_equal 'bar', @article.bio_html
  end
end
