require 'rinku'
require 'tag_helper'

AutoHtml.add_filter(:link).with({}) do |text, options|
  Rinku.auto_link(text, :all, TagHelper.attributes(options))
end
