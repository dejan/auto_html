require 'tag_helper'

AutoHtml.add_filter(:image).with({:alt => ''}) do |text, options|
  text.gsub(/https?:\/\/.+\.(jpg|jpeg|bmp|gif|png)(\?\S+)?/i) do |match|
    TagHelper.image_tag(match, options)
  end
end