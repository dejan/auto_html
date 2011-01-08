require File.expand_path('../../test_helper', __FILE__)
require File.expand_path('../../fixture_setup', __FILE__)

# store default so we can revert so that other tests use default option
default_suffix = AutoHtmlFor.auto_html_for_options[:htmlized_attribute_suffix]
AutoHtmlFor.auto_html_for_options[:htmlized_attribute_suffix] = '_htmlized'

class Article < ActiveRecord::Base
  auto_html_for :body do
    simple_format
  end
end

class AutoHtmlForOptionsTest < Test::Unit::TestCase
  include FixtureSetup

  def test_transform_after_save
    @article = Article.new(:body => 'Yo!')
    assert_equal '<p>Yo!</p>', @article.body_htmlized
    @article.save!
    assert_equal '<p>Yo!</p>', @article.body_htmlized
  end
end

# reverting to default so that other tests use default option
AutoHtmlFor.auto_html_for_options[:htmlized_attribute_suffix] = default_suffix