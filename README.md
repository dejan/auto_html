# AutoHtml

AutoHtml is a collection of filters that transform plain text into HTML code.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'auto_html'
```

And then execute:

```sh
$ bundle
```

Or install it yourself as:

```sh
$ gem install auto_html
```

## Abstract

AutoHtml uses concepts found in "Pipes and Filters" processing design pattern:

* `Filter` - transforms an input. In AutoHtml context, this is any object that does the transformation through `#call(String)` method. Filter options should be passed in initializer. AutoHtml provides some filters already, ie Link, Image, Markdown, etc.
* `Pipeline` - a composition of filters that transforms input by passing the output of one filter as input for the next filter in line. In AutoHtml context, this is the `AutoHtml::Pipeline` class. Since the same interface (method `#call`) is used to pass input, we can say that Pipeline is just another Filter, which means it can be used as a building block for other Pipelines, in a mix with other filters.

## Examples

```ruby
link_filter = AutoHtml::Link.new(target: '_blank')
link_filter.call('Checkout out my blog: http://rors.org')
# => 'Checkout out my blog: <a target="blank" href="http://rors.org">http://rors.org</a>'

emoji_filter = AutoHtml::Emoji.new
emoji_filter.call(':point_left: yo!')
# => '<img src="/images/emoji/unicode/1f448.png" class="emoji" title=":point_left:" alt=":point_left:" height="20" witdh="20" align="absmiddle" /> yo!'

# Use Pipeline to combine filters
base_format = AutoHtml::Pipeline.new(link_filter, emoji_filter)
base_format.call('Checkout out my blog: http://rors.org :point_left: yo!')
# => 'Checkout out my blog: <a href="http://rors.org">http://rors.org</a> <img src="/images/emoji/unicode/1f448.png" class="emoji" title=":point_left:" alt=":point_left:" height="20" witdh="20" align="absmiddle" /> yo!'

# A pipeline can be reused in another pipeline. Note that the order of filters is important - ie you want
# `Image` before `Link` filter so that URL of the image gets transformed to `img` tag and not `a` tag.
comment_format = AutoHtml::Pipeline.new(AutoHtml::Markdown.new, AutoHtml::Image.new, base_format)
comment_format.call("Hello!\n\n Checkout out my blog: http://rors.org :point_left: yo! \n\n http://gifs.joelglovier.com/boom/booyah.gif")
# => "<p>Hello!</p>\n\n<p>Checkout out my blog: <a href="<img src="http://rors.org" target="_blank">http://rors.org</a> <img src="/images/emoji/unicode/1f448.png" />" class="emoji" title=":point_left:" alt=":point_left:" height="20" witdh="20" align="absmiddle" /> yo! </p>\n\n<p><a href="<img src="http://gifs.joelglovier.com/boom/booyah.gif" />" target="_blank"><img src="http://gifs.joelglovier.com/boom/booyah.gif" /></a></p>\n"
```

## Bundled filters

Bellow is the list of bundled filters along with their optional arguments on initialization and their default values.

* `AutoHtml::Emoji`, width: 20, height: 20, asset_root: '/images'
* `AutoHtml::HtmlEscape`
* `AutoHtml::Image`, proxy: nil, alt: nil
* `AutoHtml::Link`, target: nil, rel: nil
* `AutoHtml::Markdown`
* `AutoHtml::SimpleFormat`

## Code status

[![Circle CI](https://circleci.com/gh/dejan/auto_html.svg?style=svg&circle-token=57823c8b62302106564f97b58b64643b9760ed99)](https://circleci.com/gh/dejan/auto_html)

## Licence

AutoHtml is released under the [MIT License](https://raw.githubusercontent.com/dejan/auto_html/master/MIT-LICENCE).
