require File.dirname(__FILE__) + '/../test_helper'

class Article < ActiveRecord::Base
  auto_html_for :body do
    html_escape
    youtube(:width => 400, :height => 250)
    image
    link(:target => "_blank", :rel => "nofollow")
    simple_format
  end
end

class AutoHtmlForTest < Test::Unit::TestCase

  def setup
    fixtures_dir = File.dirname(__FILE__) + '/../fixtures'
    connections = YAML.load_file("#{fixtures_dir}/database.yml")
    ActiveRecord::Base.establish_connection(connections['sqlite3'])
    ActiveRecord::Migration.verbose = false
    load "#{fixtures_dir}/schema.rb"
  end

  def test_transform_after_save
    @article = Article.new(:body => 'Yo!')
    @article.save!
    assert_equal '<p>Yo!</p>', @article.body_html
  end

  def test_transform_after_update
    @article = Article.create!(:body => 'Yo!')
    @article.update_attributes(:body => 'http://vukajlija.com')
    @article.save!
    assert_equal '<p><a href="http://vukajlija.com" rel="nofollow" target="_blank">http://vukajlija.com</a></p>', @article.body_html
  end

end

