# AutoHtml is a collection of filters that transform plain text into HTML code.
module AutoHtml
  autoload :Pipeline,     'auto_html/pipeline'

  autoload :Emoji,        'auto_html/emoji'
  autoload :HtmlEscape,   'auto_html/html_escape'
  autoload :Image,        'auto_html/image'
  autoload :Link,         'auto_html/link'
  autoload :Markdown,     'auto_html/markdown'
  autoload :SimpleFormat, 'auto_html/simple_format'
end
