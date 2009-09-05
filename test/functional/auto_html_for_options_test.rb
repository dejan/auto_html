require File.dirname(__FILE__) + '/../test_helper'
require File.dirname(__FILE__) + '/../fixture_setup'

# store default so we can revert so that other tests use default option
default_suffix = AutoHtmlFor.auto_html_for_options[:htmlized_attribute_suffix]
AutoHtmlFor.auto_html_for_options[:htmlized_attribute_suffix] = '_htmlized'

class Article < ActiveRecord::Base
  auto_html_for :body do
    simple_format
  end
end

class AutoHtmlForTest < Test::Unit::TestCase
  include FixtureSetup

  def test_transform_after_save
    @article = Article.new(:body => 'Yo!')
    @article.save!
    assert_equal '<p>Yo!</p>', @article.body_htmlized
  end
end

# reverting to default so that other tests use default option
AutoHtmlFor.auto_html_for_options[:htmlized_attribute_suffix] = default_suffix